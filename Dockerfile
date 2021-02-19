FROM python:3.8.5

ARG USER_ID
ARG GROUP_ID
ARG USERNAME

RUN apt-get update -y
RUN apt-get install sudo vim openssh-server -y

RUN pip install pandas psycopg2 SQLAlchemy
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN addgroup --gid $GROUP_ID $USERNAME 
RUN useradd --uid $USER_ID --gid $GROUP_ID $USERNAME \ 
    && echo "${USERNAME}:123" | chpasswd

RUN mkdir -p /home/${USERNAME}/.ssh
RUN chown -R renato:renato /home/${USERNAME}
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

EXPOSE 22
USER $USERNAME
WORKDIR /home/${USERNAME}

