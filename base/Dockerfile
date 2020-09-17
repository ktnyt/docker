FROM ubuntu:latest

ARG USER=user
ENV USER $USER
ENV HOME /home/$USER

RUN set -eux && \
    apt-get update && \
    apt-get install -y gosu sudo zsh && \
    rm -rf /var/lib/apt/lists/* && \
    gosu nobody true && \
    sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY zshrc /tmp/zshrc
ENV SHELL /usr/bin/zsh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD [ "/usr/bin/zsh" ]