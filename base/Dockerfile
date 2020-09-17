FROM ubuntu:latest

ARG USER=user
ENV USER $USER
ENV HOME /home/$USER

RUN set -eux \ 
    && apt-get update \ 
    && apt-get install -y gosu sudo \ 
    && rm -rf /var/lib/apt/lists/* \ 
    && gosu nobody true \ 
    && sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["bash"]