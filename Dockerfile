ARG BASE_IMAGE_NAME="defval"
ARG BASE_IMAGE_TAG="defval"

FROM ghcr.io/astral-sh/uv:0.12.10 AS ghcr_uv
FROM hashicorp/envconsul:0.14 AS envconsul

FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}
LABEL \
    org.opencontainers.image.authors="Alexander Chaykovskiy  https://github.com/alexchay" \
    org.opencontainers.image.created=2026-11-02T09:36:16Z \
    org.opencontainers.image.url=https://github.com/alexchay/docker-ansible-core \
    org.opencontainers.image.documentation=https://github.com/alexchay/docker-ansible-core\
    org.opencontainers.image.source=https://github.com/alexchay/docker-ansible-core \
    org.opencontainers.image.version=2026.11.02.1 \
    org.opencontainers.image.licenses=MIT

ENV \
    ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections/ \
    ANSIBLE_COLLECTIONS_SYSTEM_PATH=/usr/share/ansible/collections/

USER root
# hadolint ignore=SC2086
RUN \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    gettext-base \
    git \
    jq \
    iproute2 \
    iputils-ping \
    openssh-client \
    procps \
    patch \
    sshpass \
    sudo \
    time \
    tree \
    && chown root:root /bin/ping && chmod +s /bin/ping \
    && mkdir -p ${ANSIBLE_COLLECTIONS_SYSTEM_PATH} && chown -R $USERNAME:$GROUPNAME ${ANSIBLE_COLLECTIONS_SYSTEM_PATH} \
    && apt-get clean \
    && rm -rf /tmp/* && rm -rf /var/cache/apt/* \
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
    UV_NO_MANAGED_PYTHON=1 \
    UV_PYTHON_DOWNLOADS=never \
    UV_CACHE_DIR=$HOME/.cache/uv


# ENV PYTHONMALLOC=malloc
# hadolint ignore=DL3013,DL3041,DL3042
RUN \
    --mount=type=cache,target=$HOME/.cache/uv,uid=$USER_UID,gid=$USER_GID \
    --mount=type=bind,source=ansible_collections.yml,target=ansible_collections.yml \
    --mount=type=bind,source=ansible_requirements.txt,target=ansible_requirements.txt \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir ansible-core==${ANSIBLE_CORE_VERSION} -r ansible_requirements.txt && \
    ansible-galaxy collection install -r ansible_collections.yml --collections-path ${ANSIBLE_COLLECTIONS_SYSTEM_PATH} --force && \
    uv tool install ansible-lint  && \
    uv tool install go-task-bin

CMD [ "ansible-playbook", "--version" ]
