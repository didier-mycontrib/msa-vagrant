echo START of restart-docker-compose
sleep 2
echo DOCKER_COMPOSE_DOWN
sh ./docker-compose-down.sh
sleep 2
echo DOCKER_COMPOSE_UP
sh ./docker-compose-up-bg.sh
echo END of restart-docker-compose