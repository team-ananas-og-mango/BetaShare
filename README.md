# Architecture
![Architecture](assets/arch.png?raw=true "Architecture")

# Submodules
`git submodule update --remote --merge`

`git submodule add URL-OF-REPO`

# Docker

## Start
`docker compose up --build --force-recreate`



## Kafka-connect

### Setup cassandra connector
`
curl -X POST http://localhost:8083/connectors -H 'Content-Type: application/json' -d \
'{
	"name": "stock-sink",
	"config": {
		"connector.class": "com.datastax.oss.kafka.sink.CassandraSinkConnector",
		"tasks.max": "1",
		"topics": "xcse",
		"contactPoints": "cassandra",
		"loadBalancing.localDc": "DC1",
		"port": 9042,
		"topic.xcse.stocks_keyspace.stocks.mapping": "symbol=value.Symbol, ts=value.Time, close=value.Close, high=value.High, interest=value.Interest, low=value.Low, open=value.Open, volume=value.Volume",
		"key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "key.converter.schemas.enable": false,
        "value.converter.schemas.enable": false
	}
}'
`

### Setup flink connector
`
curl -X POST http://localhost:8083/connectors -H 'Content-Type: application/json' -d \
'{
	"name": "ema-avg-sink",
	"config": {
		"connector.class": "com.datastax.oss.kafka.sink.CassandraSinkConnector",
		"tasks.max": "1",
		"topics": "ema",
		"contactPoints": "cassandra",
		"loadBalancing.localDc": "DC1",
		"port": 9042,
		"topic.ema.stocks_keyspace.ema.mapping": "symbol=value.Symbol, ts=value.Time, ema_10=value.ema_10, ema_100=value.ema_100, advise=value.advise",
		"key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "key.converter.schemas.enable": false,
        "value.converter.schemas.enable": false
	}
}'
`

### Get connectors
`curl -X GET http://localhost:8083/connectors`

### Get status of connector
`curl -X GET http://localhost:8083/connectors/cassandra-json-sink/status`

## Rebuild container

`docker-compose up -d --force-recreate --no-deps --build movingaverageservice`

`docker-compose up -d --force-recreate --no-deps --build saxostockservice`

# Swap context
`gcloud auth list`

`gcloud config set account x@gmail.com`

`kubectl config get-contexts`

`kubectl config use-context y`