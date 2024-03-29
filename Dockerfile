FROM docker.io/eclipse-temurin:17 as jre-build
RUN jlink \
 --add-modules java.desktop,java.management,java.naming,jdk.zipfs \
 --no-header-files \
 --no-man-pages \
 --compress=2 \
 --output /javaruntime
FROM debian:buster-slim
ARG EULA=false
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME
RUN mkdir /opt/app
ADD https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar /opt/app/server.jar
WORKDIR /opt/app
RUN ["java", "-Xmx2048M", "-jar", "/opt/app/server.jar", "nogui"]
RUN echo eula=$EULA > /opt/app/eula.txt
CMD ["java", "-Xmx2048M", "-jar", "/opt/app/server.jar", "nogui"]
EXPOSE 25565

