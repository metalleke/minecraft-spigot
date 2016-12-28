# Minecraft spigot docker
A docker file for minecraft spigot server.
https://www.spigotmc.org/

## Source:
https://hub.docker.com/r/kevinvr/minecraft-spigot/

## Example:
docker run -d --name minecraft-spigot -e EULA=TRUE -p 25565:25565 -p 8123:8123 -v /locationtodatafolder/data:/data kevinvr/minecraft-spigot