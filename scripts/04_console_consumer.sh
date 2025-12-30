#!/usr/bin/env bash

# ------------------------------------------------------
# Script Name: 04_console_consumer.sh
# Description:
#   This script consumes messages from the Kafka topic
#   named 'atscale' using the Kafka console consumer.
#
# Prerequisites:
#   - Kafka broker running on localhost:9092
#   - kafka-console-consumer.sh available in PATH
# ------------------------------------------------------

set -e

kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic atscale \
  --property print.key=true \
  --property key.separator=, \
  --group churn_group
