FROM docker.io/eclipse-temurin:21
ARG EULA=false
WORKDIR /opt/app
ADD https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar /opt/app/server.jar
RUN ["java", "-Xmx2048M", "-jar", "/opt/app/server.jar", "nogui"]
RUN echo eula=$EULA > /opt/app/eula.txt
CMD ["java", "-Xmx2048M", "-jar", "/opt/app/server.jar", "nogui"]
EXPOSE 25565

