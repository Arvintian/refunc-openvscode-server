FROM --platform=$TARGETPLATFORM gitpod/openvscode-server:1.77.3

ARG TARGETOS
ARG TARGETARCH
USER root

ENV DEBIAN_FRONTEND noninteractive TZ=Asia/Shanghai LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
RUN apt-get update && mkdir /compiler && \
    apt-get install -y apt-utils openssl ca-certificates && \
    apt-get install -y vim wget curl iputils-ping build-essential net-tools && \
    apt-get install -y locales && locale-gen en_US.UTF-8 && \
    apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

ENV COMPILER_PATH=/compiler MINICONDA_PY310_VERSION=py310_22.11.1-1 MINICONDA_PY39_VERSION=py39_22.11.1-1 MINICONDA_PY38_VERSION=py38_22.11.1-1 GOLANG_VERSION=1.19.3
ENV PATH=${COMPILER_PATH}/miniconda310/bin:${COMPILER_PATH}/miniconda39/bin:${COMPILER_PATH}/miniconda38/bin:${COMPILER_PATH}/go/bin:${PATH}
COPY compilers/$TARGETOS/$TARGETARCH/install.sh /tmp/
RUN chmod +x /tmp/install.sh && /tmp/install.sh && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
    pip install -U refunc-cli -i https://pypi.tuna.tsinghua.edu.cn/simple && rm -rf $HOME/.cache

USER openvscode-server