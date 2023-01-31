# Move files to docker container
From local machine:\
`docker container ls` \
`sudo docker cp ~/Desktop/stocks.csv <docker-container-id>:/stocks.csv`

# Move files from docker container
From local machine:\
`docker container ls` \
`sudo docker cp <docker-container-id>:/stocks.csv ~/Desktop/stocks.csv`

# Cassandra import data
`COPY stocks FROM 'stocks.csv' WITH HEADER = TRUE;`

# Casandra export data
`COPY stocks TO 'stocks.csv' WITH HEADER = TRUE;`