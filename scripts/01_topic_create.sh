#!/usr/bin/env bash

# ------------------------------------------------------
# Script Name: 01_topic_create.sh
# Description:
#   This script creates a Kafka topic named 'atscale'
#   with a single replication factor and two partitions.
#
# Prerequisites:
#   - Kafka broker running on localhost:9092
#   - kafka-topics.sh available in PATH
# ------------------------------------------------------

set -e

kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --create \
  --topic atscale \
  --replication-factor 1 \
  --partitions 2

echo "Topic 'atscale' successfully created."
