#Create a postgres database (in docker container) for kong
docker run -d --name kong-database \
  --network=conf-docker_mynetwork \
  -p 5432:5432 \
  -e "POSTGRES_USER=kong" \
  -e "POSTGRES_DB=kong" \
  -e "POSTGRES_PASSWORD=kong" \
  postgres:9.6
  
#if contrainer is stopped , restart via
#docker container start kong-database  