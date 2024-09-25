#docker-compose up &
export HOST_MOUNT_PATH=/vagrant/s_c_data_flow/myapps
export BP_JVM_VERSION=-jdk17
export DATAFLOW_VERSION=2.11.3
export SKIPPER_VERSION=2.11.3
docker-compose -f docker-compose.yml -f docker-compose-kafka.yml -f docker-compose-mariadb.yml up --force-recreate
