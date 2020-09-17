FROM ktnyt/base:latest

RUN apt-get update && apt-get install -y --no-install-recommends zsh \
    && rm -rf /var/lib/apt/lists/*

ENV SHELL /usr/bin/zsh
COPY zshrc /tmp/zshrc
COPY setup.sh /tmp
RUN chmod +x /tmp/setup.sh

RUN echo '/tmp/setup.sh' >> /etc/zsh/zshenv

CMD ["zsh"]