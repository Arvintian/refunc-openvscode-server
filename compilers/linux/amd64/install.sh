wget -O /tmp/miniconda310.sh "https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-${MINICONDA_PY310_VERSION}-Linux-x86_64.sh" && \
chmod a+x /tmp/miniconda310.sh && bash /tmp/miniconda310.sh -p ${COMPILER_PATH}/miniconda310 -b && \
wget -O /tmp/miniconda39.sh "https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-${MINICONDA_PY39_VERSION}-Linux-x86_64.sh" && \
chmod a+x /tmp/miniconda39.sh && bash /tmp/miniconda39.sh -p ${COMPILER_PATH}/miniconda39 -b && \
wget -O /tmp/miniconda38.sh "https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-${MINICONDA_PY38_VERSION}-Linux-x86_64.sh" && \
chmod a+x /tmp/miniconda38.sh && bash /tmp/miniconda38.sh -p ${COMPILER_PATH}/miniconda38 -b && \
wget -O /tmp/go.tgz "https://golang.google.cn/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" && \
mkdir ${COMPILER_PATH}/go && tar --extract --file /tmp/go.tgz --strip-components 1 --directory ${COMPILER_PATH}/go