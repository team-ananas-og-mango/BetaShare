from kafka import KafkaProducer
import json
import os

# Kafka configuration
bootstrap_servers = '34.88.11.32:9094'
topic = 'xcse'

# Create Kafka producer
producer = KafkaProducer(bootstrap_servers=bootstrap_servers,
                         value_serializer=lambda v: json.dumps(v).encode('utf-8'))

path = os.path.dirname(os.path.abspath(__file__))

# Read JSON file
with open(f'{path}/129971-ETR.json', 'r') as file:
    data = json.load(file)

# Extract desired keys and send messages to Kafka
for item in data:
    message = {
        'Close': item['Close'],
        'High': item['High'],
        'Interest': item['Interest'],
        'Low': item['Low'],
        'Open': item['Open'],
        'Time': item['Time'],
        'Volume': item['Volume'],
        'Symbol': item['Symbol']
    }
    producer.send(topic, value=message)

# Flush and close the producer
producer.flush()
producer.close()