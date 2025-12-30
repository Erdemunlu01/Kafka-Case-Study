from kafka import KafkaProducer
import time

# Broker settings
producer = KafkaProducer(
    bootstrap_servers=["localhost:9092"]
)

# Sample data
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
