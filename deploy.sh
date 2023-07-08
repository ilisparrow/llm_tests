docker stop bdi
docker rm bdi
docker build -t bdi-image . 
docker run -p 8507:80 -d --name bdi bdi-image 
