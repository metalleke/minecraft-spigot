# Minecraft spigot server latest dockerfile
# AlpineLinux with java 8 jre
FROM java:8-jre-alpine

MAINTAINER Kevin Van Raepenbusch <metalleke@gmail.com>

# Update certificates, install bash and git
RUN apk update \                                                                                                                                                                                                                        
  && apk add ca-certificates wget \                                                                                                                                                                                                      
  && update-ca-certificates \
  && apk add bash \
  && apk add git \
  && rm -rf /var/cache/apk/*

# Download build tool
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Get latest version from spigotmc
RUN java -jar BuildTools.jar --rev latest

# Sets working directory for the CMD instruction (also works for RUN, ENTRYPOINT commands)
# Create mount point, and mark it as holding externally mounted volume
WORKDIR /data
VOLUME /data

# Expose the container's network port: 25565 during runtime.
EXPOSE 25565

#Start spigot Minecraft server
CMD echo eula=true > /data/eula.txt && java -Xms1G -Xmx3G -XX:+UseConcMarkSweepGC -jar /spigot-1.11.2.jar nogui --noconsole