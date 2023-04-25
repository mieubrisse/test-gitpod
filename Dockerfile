FROM gitpod/workspace-base

RUN sudo service start docker

RUN echo "deb [trusted=yes] https://apt.fury.io/kurtosis-tech/ /" | sudo tee /etc/apt/sources.list.d/kurtosis.list
RUN sudo apt update
RUN sudo apt install kurtosis-cli

# Download the Kurtosis engine & APIC images
RUN kurtosis engine restart
RUN kurtosis enclave add

# Clean things up for the next guy
RUN kurtosis engine stop
RUN kurtosis clean -a

# Enable tab completion
RUN echo "source <(kurtosis completion bash)" >> ~/.bashrc
