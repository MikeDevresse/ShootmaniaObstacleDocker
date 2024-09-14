FROM ubuntu:latest

WORKDIR /shootmania

RUN apt update -y && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt update -y && \
    apt install -y wget zip rsync php7.4 php7.4-mysql php7.4-zip php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml supervisor mysql-client && \
    wget http://files.v04.maniaplanet.com/server/ManiaplanetServer_Latest.zip && \
    unzip ManiaplanetServer_Latest.zip && \
    wget https://v4.live.maniaplanet.com/ingame/public/titles/download/obstacle@smokegun.Title.Pack.gbx -O Packs/obstacle@smokegun.Title.Pack.gbx && \
    wget https://github.com/SM-Obstacle/Titlepack/releases/download/v2.7/assets_v2-7.zip && \
    unzip assets_v2-7.zip && \
    rsync -av assets_v2-7/ GameData/

RUN wget https://download.maniacontrol.com/beta/ManiaControl_beta_0-256.zip && \
    unzip ManiaControl_beta_0-256.zip

COPY matchsettings.txt ./UserData/Maps/matchsettings.txt

RUN wget https://sm.mania-exchange.com/maps/download/42577 -O "UserData/Maps/StepbyStepbyAureletSwytsh.Map.Gbx"
RUN mkdir /tmp/supervisor

COPY entrypoint.sh      /etc/entrypoint.sh
COPY supervisord.conf   /etc/supervisord.conf

# ENTRYPOINT ["/etc/entrypoint.sh"]