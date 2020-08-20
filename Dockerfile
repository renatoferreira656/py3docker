FROM python:3.8.5-buster

ARG USER_ID
ARG GROUP_ID
ARG USERNAME

RUN apt-get update -y
RUN apt-get install sudo vim -y

RUN pip install pandas

RUN addgroup --gid $GROUP_ID $USERNAME 
RUN useradd --uid $USER_ID --gid $GROUP_ID $USERNAME \ 
    && echo "${USERNAME}:123" | chpasswd

USER $USERNAME
WORKDIR /home/${USERNAME}