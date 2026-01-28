ARG BASE_IMAGE=nvcr.io/nvidia/isaac/ros:aarch64-ros2_humble_4c0c55dddd2bbcc3e8d5f9753bee634c
FROM ${BASE_IMAGE}

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=1000

RUN if ! getent group ${USER_GID} >/dev/null; then groupadd --gid ${USER_GID} ${USERNAME}; fi \
    && if ! id -u ${USERNAME} >/dev/null 2>&1; then useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USERNAME}; fi \
    && mkdir -p /home/${USERNAME} \
    && chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}
