FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04

# install ubuntu dependencies
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \
    apt-get -y install python3-pip xvfb ffmpeg git build-essential python-opengl
RUN ln -s /usr/bin/python3 /usr/bin/python

# install python dependencies
RUN pip install --upgrade pip

# install mujoco_py
# RUN apt-get -y install wget unzip software-properties-common \
#     libgl1-mesa-dev \
#     libgl1-mesa-glx \
#     libglew-dev \
#     libosmesa6-dev patchelf

# COPY entrypoint.sh /usr/local/bin/
# RUN chmod 777 /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# copy local files
COPY ./decision_transformer /decision_transformer
COPY ./scripts /scripts