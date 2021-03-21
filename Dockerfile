# Grab the base image
FROM balenalib/rpi-raspbian:buster

# Install the essentials for building
RUN apt update && apt install git gcc make build-essential

# Grab and build StreamEye
RUN git clone https://github.com/ccrisan/streameye.git
RUN cd streameye && make && make install

# Remove unneeded stuff
RUN apt remove build-essential git gcc make && apt autoremove