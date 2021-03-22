# Grab the base image
FROM balenalib/raspberry-pi-python:3-latest

# Copy in the shell script
COPY run.sh /
RUN chmod +x run.sh

# Install the essentials for building
RUN apt update && apt install git gcc make build-essential

# Grab and build StreamEye
RUN git clone https://github.com/neaveeng/streameye.git
RUN cd streameye && make && make install
RUN pip3 install picamera

# Remove unneeded stuff
RUN apt remove build-essential git gcc make && apt autoremove

CMD [ "/run.sh" ]