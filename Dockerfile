FROM gitpod/workspace-base

WORKDIR /docker-images

COPY engine.tgz .
COPY core.tgz .

WORKDIR /root

RUN echo "deb [trusted=yes] https://apt.fury.io/kurtosis-tech/ /" | sudo tee /etc/apt/sources.list.d/kurtosis.list
RUN sudo apt update
RUN sudo apt install kurtosis-cli

# Enable tab completion
RUN echo "source <(kurtosis completion bash)" >> ~/.bashrc
