FROM ubuntu:20.04

LABEL author="Maja Franz <maja.franz@othr.de>"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"

# Install required packages
RUN apt-get update && apt-get install -y \
        python3 \
        python3-pip \
        graphviz


# Add user
RUN useradd -m -G sudo -s /bin/bash hackathon && echo "hackathon:hackathon" | chpasswd
RUN usermod -a -G staff hackathon
USER hackathon

# Add artifacts (from host) to home directory
ADD --chown=hackathon:hackathon . /home/hackathon/hackathon

WORKDIR /home/hackathon/hackathon

# install python packages
ENV PATH $PATH:/home/hackathon/.local/bin
RUN pip3 install -r requirements.txt

ENTRYPOINT ["./run.sh"]
CMD ["jupyter"]