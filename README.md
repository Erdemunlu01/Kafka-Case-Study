# Kafka Case Study – Topic Management and Python Producer/Consumer

This repository is a hands-on Kafka case study focused on **topic management** and  
**developing producer and consumer applications using Python**.

It is designed for people who are new to Kafka or want to practice:
- Creating and managing Kafka topics
- Observing the produce / consume workflow
- Understanding Kafka integration with Python

---

## Repository Content

This repository contains the following components:

- `README.md`  
  → Project overview and workflow description

- `docs/`  
  → Step-by-step case study documentation and sample outputs

- `kafka_python/`  
  → Python producer and consumer examples

---

## Requirements

To run this case study, the following requirements must be met:

- A running Kafka broker  
  - `bootstrap-server`: `localhost:9092`
- Python 3.x
- Python package: `kafka-python`

If Kafka CLI commands (`kafka-topics.sh`, `kafka-console-consumer.sh`, etc.)
work in your terminal, your environment is ready.

---

## Case Study Flow

The general workflow followed in this repository is:

1. Create a Kafka topic  
2. List existing topics  
3. Inspect topic details (partition, replication, leader information)  
4. Produce data to Kafka  
5. Consume data from Kafka  
6. Delete the topic  
7. Run Python producer and consumer examples  

All steps are demonstrated through a **single Kafka case study**.

---

## Python Producer / Consumer

This repository includes simple examples demonstrating how to use Kafka with Python.

These examples show:
- Message key usage
- Partition distribution
- Consumer group behavior
- Message timestamp handling

---

## Documentation

All technical details, Kafka commands, and sample outputs for this case study
are provided in the documentation files.

---

## Goal

The goal of this repository is to:
- Demonstrate Kafka topic management in practice
- Explain the produce / consume concept clearly
- Provide a simple introduction to Kafka integration with Python

---

## Feedback

Feel free to open an issue for any feedback or suggestions.

---

## 📁 Repository Structure

kafka-case-study/
├─ README.md
├─ docs/
│  ├─ tr/
│  │  └─ 01_topic_olusturma_produce_consume.md
│  └─ en/
│     └─ 01_topic_create_produce_consume.md
├─ scripts/
│  ├─ 01_topic_create.sh
│  ├─ 02_topic_list.sh
│  ├─ 03_topic_describe.sh
│  ├─ 04_console_consumer.sh
│  └─ 05_topic_delete.sh
└─ kafka_python/
   ├─ cs_producer_01.py
   └─ cs_consumer_02.py

---