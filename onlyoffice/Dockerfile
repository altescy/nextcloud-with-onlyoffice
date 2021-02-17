FROM onlyoffice/documentserver:latest

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

WORKDIR  /work

RUN apt-get update && apt-get install -y curl unzip
# Install IPA fonts
RUN apt-get install -y fonts-ipafont fonts-ipaexfont
# Install Noto fonts
RUN apt-get install -y fonts-noto-cjk fonts-noto-color-emoji
# Install Cica fonts
RUN curl -LO https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip && \
    unzip Cica_v5.0.2_with_emoji.zip -d cica && \
    mkdir -p /usr/share/fonts/truetype/cica && \
    cp cica/*.ttf /usr/share/fonts/truetype/cica/ && \
    rm -rf Cica_v5.0.2_with_emoji.zip cica

# Update font settings
COPY ./fonts/local.conf /etc/fonts/local.conf
RUN fc-cache -fv

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["/app/ds/run-document-server.sh"]
