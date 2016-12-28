# Minecraft spigot docker
A docker file for minecraft spigot server.
https://www.spigotmc.org/

## Source:
https://hub.docker.com/r/kevinvr/minecraft-spigot/

## Example:
docker run -d --name minecraft-spigot -p 25565:25565 -v /locationtomountdatafolder:/minecraft/data kevinvr/minecraft-spigot

## Variables:

Variable | Default | Description 
------------ | -------------
JVM_OPTS | -Xmx1024M -Xms1024M -XX:+UseConcMarkSweepGC | Java options
REV | latest | Version for spigot