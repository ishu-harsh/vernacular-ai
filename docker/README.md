# DevOps Support Engineer Role

In this document we keep few questions for assignment rounds.

### 1. Docker
Docker is a tool to create, deploy, and run applications by using containers. It allows a developer to package up an application with all of the parts it needs, such as libraries and other dependencies thus allowing him/her to `Build once Run Anywhere`.

You have to write a [Dockerfile](https://docs.docker.com/engine/reference/builder/) with **Ubuntu 16.04** as a base image. The image should have following packages present:
- telnet
- curl
- ffmpeg

Finally, when running a container from the docker image, it should launch with `bash`.

Deliverables:
- A Dockerfile
- A README file with instructions on how to build and run the image

#### Learning Resources
- https://docs.docker.com/
- https://training.play-with-docker.com/beginner-linux/


### Solution : 

Run the following command to build the image.

```shel
cd docker 
docker build -t custom-image:1.0.0 .   
```
After successfully build,  run the image with the following command : 
 
 ```shel
 docker run -it custom-image:1.0.0 /bin/bash 
 ```

Now the image will be running with `bash` in interactive mode in your terminal



### `Dockerfile` Content :

```
FROM ubuntu:16.04


# Installing Packages
RUN apt-get update && \
    apt-get install -y telnet && \
    apt-get install -y curl && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/* 
```
