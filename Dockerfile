# Use an official Ubuntu image as a parent image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libzmq5 \
    libzmq3-dev \  
#    libzmqpp-dev \  
    liblog4cxx-dev \
    libpcap0.8 \
    libpcap-dev \
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
    liblzma5 \
    libzstd1 \
    liblz4-1 \
    libcap2 \
    libgcrypt20 \
    libgpg-error0 \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /usr/src/app
# COPY . .

# Navigate to the directory containing the Makefile
# WORKDIR /usr/src/app/md_processor_Release/Release

# Build the application
#RUN make clean && make all

# Verify the executable has been created
#RUN if [ -f md_processor ]; then echo "Executable md_processor exists."; else echo "Executable md_processor not found."; exit 1; fi
