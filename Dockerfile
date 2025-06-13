ARG BASE_IMAGE_NAME="defval"
ARG BASE_IMAGE_TAG="defval"

FROM ghcr.io/astral-sh/uv:0.7.13 AS ghcr_uv
FROM hashicorp/envconsul:0.13 AS envconsul

FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}
LABEL \
    org.opencontainers.image.authors="Alexander Chaykovskiy  https://github.com/alexchay" \
    org.opencontainers.image.created=2025-06-13T15:52:19Z \
    org.opencontainers.image.url=https://github.com/alexchay/docker-ansible-core \
    org.opencontainers.image.documentation=https://github.com/alexchay/docker-ansible-core\
    org.opencontainers.image.source=https://github.com/alexchay/docker-ansible-core \
    org.opencontainers.image.version=2025.06.13.0 \
    org.opencontainers.image.licenses=MIT

USER root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# hadolint ignore=SC2086
RUN \
  --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    jq \
    openssh-client \
    patch \
    sshpass \
    sudo \
    time \
    tree \
    && rm -rf /tmp/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man


# hadolint ignore=SC2086
RUN <<EOT
    set -ex
    mkdir -p /etc/ssh
    chown -R :$GROUPNAME /etc/ssh
    chmod -R g+rwx /etc/ssh
    echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/tee" > /etc/sudoers.d/$USERNAME
EOT

USER $USERNAME
WORKDIR $HOME

COPY --from=ghcr_uv --chown=$USERNAME:$GROUPNAME --chmod=755 /uv /uvx $HOME/.local/bin/
COPY --from=envconsul --chown=$USER_UID:$USER_GID --chmod=755 /bin/envconsul $HOME/.local/bin/envconsul

ARG ANSIBLE_CORE_VERSION=defval
ENV ANSIBLE_CORE_VERSION=$ANSIBLE_CORE_VERSION
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never

# Install ansible-core
# ENV PYTHONMALLOC=malloc
RUN \
    --mount=type=cache,target=$HOME/.cache/uv,uid=$USER_UID,gid=$USER_GID \
    --mount=type=bind,source=ansible_collections.yml,target=ansible_collections.yml \
    uv tool install ansible-core==${ANSIBLE_CORE_VERSION} --with ansible-lint \
    && uv tool install go-task-bin \
    # Due to executables provided by dependencies of tool packages are not installed in bin, find all executable files in the ansible-core bin directory (excluding hidden files),
    # then for each file, create a symbolic link in the user's ~/.local/bin directory if the link does not already exist.
    && find "$(uv tool dir)/ansible-core/bin/" -mindepth 1 -maxdepth 1 -type f -executable -regextype posix-extended -regex '^((.+/)?)[^.]+' -print0 \
    | while IFS= read -r -d '' file; do \
        link="${HOME}/.local/bin/$(basename "$file")"; \
        [ -e "$link" ] || ln -s "$file" "$link"; \
      done \
    && ansible-galaxy collection install -r ansible_collections.yml


# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
