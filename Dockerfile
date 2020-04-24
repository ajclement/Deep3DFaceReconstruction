FROM tensorflow/tensorflow:1.12.0-gpu-py3
LABEL maintainer="olala7846@gmail.com"

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    wget \
    git \
    unzip \
    curl \
    nano \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

# Install tensorflow/models require dependencies
COPY requirements.txt .
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y protobuf-compiler \
    tzdata \
    python3-pil \
    python3-lxml \
    python3-tk \
    python3-setuptools \
    && pip3 install -r requirements.txt \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

#RUN pip install mesh_renderer

#COPY torch-1.1.0-cp35-cp35m-linux_x86_64.whl .

#RUN pip3 install torch-1.1.0-cp35-cp35m-linux_x86_64.whl


WORKDIR /usr/src/app/