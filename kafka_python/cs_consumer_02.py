from kafka import KafkaConsumer
from datetime import datetime

consumer = KafkaConsumer(
    "topic1",
    group_id="group1",
    bootstrap_servers=["localhost:9092"]
)

for msg in consumer:
    key = msg.key.decode("utf-8") if msg.key else None
    value = msg.value.decode("utf-8") if msg.value else None
    partition = msg.partition
    timestamp = datetime.fromtimestamp(msg.timestamp / 1000)
    formatted_time = timestamp.strftime("%Y-%m-%d %H:%M:%S")

    print(f"key: {key}, value: '{value}', partition: {partition}, timestamp: '{formatted_time}'")
