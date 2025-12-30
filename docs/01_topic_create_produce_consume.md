# Kafka Case Study – Topic Creation, Produce and Consume

This document presents a hands-on Kafka case study covering **topic creation**, **produce / consume operations**, and **using Kafka with Python**.

The goal of this study is to demonstrate Kafka topic management, CLI-based consumption, and Python producer/consumer integration in a clear and practical way.

---

## 1. Kafka Topic Creation

The following command is used to create a Kafka topic named `atscale`:

```bash
kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --create \
  --topic atscale \
  --replication-factor 1 \
  --partitions 2
```

### Explanation

- `bootstrap-server`: Address of the Kafka broker  
- `--topic`: Name of the topic to be created  
- `--replication-factor 1`: Set to 1 because a single broker is used  
- `--partitions 2`: Allows observing parallel consumption behavior  

---

## 2. Listing Existing Topics

To list all topics available in the Kafka cluster:

```bash
kafka-topics.sh --bootstrap-server localhost:9092 --list
```

### Sample Output

```text
__consumer_offsets
atscale
test
test1
test2
test5
topic1
```

`__consumer_offsets` is an internal Kafka topic used to store consumer offset information.

---

## 3. Describing the Topic

Details of the `atscale` topic can be inspected using the following command:

```bash
kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --topic atscale
```

### Sample Output

```text
Topic: atscale  PartitionCount: 2  ReplicationFactor: 1
Configs: segment.bytes=1073741824

Partition: 0  Leader: 0  Replicas: 0  Isr: 0
Partition: 1  Leader: 0  Replicas: 0  Isr: 0
```

### Notes

- **PartitionCount** indicates the number of partitions  
- **Leader** is the broker responsible for the partition  
- **ISR (In-Sync Replicas)** shows replicas that are synchronized  
- In a single-broker setup, leader and replica are the same  

---

## 4. Producing Data to Kafka

### 4.1 Producing Data from a CSV File

The following command sends records from a CSV file to the Kafka topic:

```bash
python dataframe_to_kafka.py \
  --input ~/datasets/Churn_Modelling.csv \
  -k 1 \
  -t atscale
```

During this step:
- The CSV file is read
- Each row is converted into a Kafka message
- Messages are produced to the `atscale` topic

---

## 5. Consuming Data from Kafka

### 5.1 Using Console Consumer

Messages produced to Kafka are consumed using the Kafka console consumer:

```bash
kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic atscale \
  --property print.key=true \
  --property key.separator=, \
  --group churn_group
```

This allows observing:
- Message keys and values
- Consumer group behavior
- Partition assignment across consumers

---

## 6. Deleting the Topic

After completing the case study, the topic is deleted using:

```bash
kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --delete \
  --topic atscale
```

To enable topic deletion, the broker configuration must have:
`delete.topic.enable=true`

---

## 7. Python Kafka Producer

The following Python producer sends region data to a Kafka topic.

```python
from kafka import KafkaProducer
import time

producer = KafkaProducer(
    bootstrap_servers=["localhost:9092"]
)

regions = [
    (1, "Marmara"),
    (2, "Ege"),
    (3, "Akdeniz"),
    (4, "İç Anadolu"),
    (5, "Karadeniz"),
    (6, "Doğu Anadolu"),
    (7, "Güneydoğu Anadolu")
]

for k, v in regions:
    producer.send(
        "topic1",
        key=str(k).encode(),
        value=v.encode()
    )
    print(f"sent -> key={k}, value={v}")
    time.sleep(0.5)

producer.flush()
```

### Producer Output

```text
sent -> key=1, value=Marmara
sent -> key=2, value=Ege
sent -> key=3, value=Akdeniz
sent -> key=4, value=İç Anadolu
sent -> key=5, value=Karadeniz
sent -> key=6, value=Doğu Anadolu
sent -> key=7, value=Güneydoğu Anadolu
```

---

## 8. Python Kafka Consumer

The following consumer reads messages from Kafka and prints metadata.

```python
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

    print(
        f"key: {key}, value: '{value}', partition: {partition}, timestamp: '{formatted_time}'"
    )
```

### Consumer Output

```text
key: 1, value: 'Marmara', partition: 0, timestamp: '2025-12-30 15:38:57'
key: 2, value: 'Ege', partition: 2, timestamp: '2025-12-30 15:38:58'
key: 3, value: 'Akdeniz', partition: 2, timestamp: '2025-12-30 15:38:58'
key: 4, value: 'İç Anadolu', partition: 1, timestamp: '2025-12-30 15:38:59'
key: 5, value: 'Karadeniz', partition: 0, timestamp: '2025-12-30 15:38:59'
key: 6, value: 'Doğu Anadolu', partition: 1, timestamp: '2025-12-30 15:39:00'
key: 7, value: 'Güneydoğu Anadolu', partition: 0, timestamp: '2025-12-30 15:39:00'
```

---

## 9. Observations

During this case study, the following Kafka behaviors were observed:

- Message keys directly influence partition assignment  
- Consumers within the same consumer group share partitions  
- Message timestamps can be tracked on both producer and consumer sides  

---

## 10. Conclusion

This case study demonstrates:

- Kafka topic lifecycle management  
- Producing and consuming messages via CLI  
- Integrating Kafka with Python applications  

in a practical and easy-to-follow manner.
