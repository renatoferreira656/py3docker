FROM python:3.8.5

ARG USER_ID
ARG GROUP_ID
ARG USERNAME

RUN apt-get update -y
RUN apt-get install sudo vim openssh-server -y

RUN addgroup --gid $GROUP_ID $USERNAME 
RUN useradd --uid $USER_ID --gid $GROUP_ID $USERNAME \ 
    && echo "${USERNAME}:123" | chpasswd

RUN mkdir -p /home/${USERNAME}/.ssh
RUN chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

EXPOSE 22
USER $USERNAME
RUN pip install pandas psycopg2 SQLAlchemy
WORKDIR /home/${USERNAME}

