docker-compose down

docker rmi $(docker ps -aq)

pkill -f :5000

clear

