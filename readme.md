# Simple StreamEye Streamer
This image was created to provide access to PiCamera functionality on Raspberry Pis running the 64bit beta OS. As of the time this was created PiCamera wasn't supported on the 64bit OS as yet, this image works around that fact.

## Overview
This image will use [StreamEye](https://github.com/neaveeng/streameye) to stream images with very low latency to a specified port. This allows you to just stream from the Pi camera or ingest those images in to another tool such as OpenCV.

Stereo stream, using a board like the [StereoPi](www.stereopi.com), is also supported. This will use the PiCamera capabilities to capture a side-by-side or top-bottom image simultansously from both cameras and combine the result in to one image.

Top-bottom is preffered from a performance perspective, an explanation for which can be found [here](https://stereopi.com/blog/ros-simple-depth-map-using-raspberry-pi). TLDR, splitting images by row is much quicker than by columns.

## Instructions
To get this up and running, install Docker on your Raspberry Pi, then grab the image using run:

`docker pull neaveeng/simple-streameye-streamer`

Once pulled, run using the following command:

`docker run -d --privileged -p 8080:8080 --device=/dev/vchiq -e ARGS=" -h 480 -w 320 -r 15 -3d top-bottom" --name streameye neaveeng/simple-streameye-streamer`

In the above example the arguments are:

`-h 480 -w 240 -r 15 -3d top-bottom`

These are required:
`h (height, pixels), w (width, pixels), r (FPS)`

`-3d top-bottom` is optional and will only work on Compute Module based boards such as the [StereoPi](www.stereopi.com) that have dual camera support. It has the options of `none`, `side-by-side`, and `top-bottom` Please note, the H and W sizes are per image in this case and will either be double height or double width as a result.

Essentially anything in the ARGS will be passed through to the script, it supports anything that the StreamEye [example script](https://github.com/NeaveEng/streameye/blob/master/extras/raspimjpeg.py) supports which is quite extensive!

# Patrons!

This project and others like it are made possible by the kind support of my [Patrons](www.patreon.com/neaveeng)!

## Patrons
Angie and John Neave

## Supporters
Adam Gilmore  
Bret Colloff  
David Shrive    
Sarah Cooper-Pinchbeck

## Followers
Alexander Gutenkunst  
Alister Perrott  
Andy Batey  
Cara S.  
Dave Booth  
Eva Blake  
John Thurmond  
Mandy Berry  
Shelagh Lewins
