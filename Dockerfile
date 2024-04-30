FROM docker.io/eclipse-temurin:21
ARG EULA=false
RUN mkdir /opt/app
ADD https://piston-data.mojang.com/v1/objects/145ff0858209bcfc164859ba735d4199aafa1eea/server.jar /opt/app/server.jar
WORKDIR /opt/app
RUN ["java", "-Xmx2048M", "-jar", "/opt/app/server.jar", "nogui"]
RUN echo eula=$EULA > /opt/app/eula.txt
CMD ["java", "-Xmx2048M", "-jar", "/opt/app/server.jar", "nogui"]
EXPOSE 25565

