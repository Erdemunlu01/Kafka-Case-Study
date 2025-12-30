#!/usr/bin/env bash

# ------------------------------------------------------
# Script Name: 05_topic_delete.sh
# Description:
#   This script deletes the Kafka topic named 'atscale'
#   and then lists remaining topics.
#
# Prerequisites:
#   - Kafka broker running on localhost:9092
#   - kafka-topics.sh available in PATH
# ------------------------------------------------------

set -e

kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --delete \
  --topic atscale

echo "Topic 'atscale' deleted."

kafka-topics.sh --bootstrap-server localhost:9092 --list
