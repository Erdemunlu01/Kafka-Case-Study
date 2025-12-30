#!/usr/bin/env bash

# ------------------------------------------------------
# Script Name: 03_topic_describe.sh
# Description:
#   This script displays detailed information
#   about the Kafka topic named 'atscale'.
#
# Prerequisites:
#   - Kafka broker running on localhost:9092
#   - kafka-topics.sh available in PATH
# ------------------------------------------------------

set -e

kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --topic atscale
