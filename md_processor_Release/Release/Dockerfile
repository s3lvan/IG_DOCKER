# Use an official Ubuntu image as a parent image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Install required packages
RUN sudo apt update && apt install -y \
    build-essential \
    libzmq5 \
    liblog4cxx-dev \
    libpcap0.8 \
    libsodium23 \
    libnorm1 \
    libgssapi-krb5-2 \
    libaprutil1 \
    libapr1 \
    libdbus-1-3 \
    libkrb5-3 \
    libk5crypto3 \
    libcom-err2 \
    libkrb5support0 \
    libcrypt1 \
    libexpat1 \
    libuuid1 \
    libsystemd0 \
    libkeyutils1 \
    libresolv \
    liblzma5 \
    libzstd1 \
    liblz4-1 \
    libcap2 \
    libgcrypt20 \
    libgpg-error0 \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Navigate to the directory containing the Makefile
WORKDIR /usr/src/app/md_processor_Release/Release

# Build the application
RUN make all

# Command to run your application
#CMD ["./md_processor"]
