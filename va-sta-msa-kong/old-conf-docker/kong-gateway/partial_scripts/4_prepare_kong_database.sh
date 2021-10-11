#Prepare kong database
docker run --rm --network=conf-docker_mynetwork \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" \
  -e "KONG_PG_PASSWORD=kong" \
  -e "KONG_PASSWORD=kong" \
  kong:latest kong migrations bootstrap