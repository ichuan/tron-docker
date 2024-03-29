FROM openjdk:8
WORKDIR /opt/coin
RUN wget https://github.com/tronprotocol/tron-deployment/raw/master/main_net_config.conf
RUN wget https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v4.5.1/FullNode.jar
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
