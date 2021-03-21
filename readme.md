# Simple StreamEye Streamer
This image was created to provide access to PiCamera functionality on Raspberry Pis running the 64bit beta OS. As of the time this was created PiCamera wasn't supported on the 64bit OS as yet, this image works around that fact.

## Overview
This image will use [StreamEye](https://github.com/ccrisan/streameye) to stream images with very low latency to a specified port. This allows you to just stream from the Pi camera or ingest those images in to another tool such as OpenCV.

Stereo stream, using a board like the [StereoPi](www.stereopi.com), is also supported. This will use the PiCamera capabilities to capture a side-by-side or top-bottom image simultansously from both cameras and combine the result in to one image.

Top-bottom is preffered from a performance perspective, an explanation for which can be found [here](https://stereopi.com/blog/ros-simple-depth-map-using-raspberry-pi). TLDR, splitting images by row is much quicker than by columns.

## Instructions
To get this up and running, install Docker on your Raspberry Pi, then grab the image using run:

`docker pull kneave/simple-streameye-streamer`

