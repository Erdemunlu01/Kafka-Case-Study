#!/usr/bin/env bash

# ------------------------------------------------------
# Script Name: 02_topic_list.sh
# Description:
#   This script lists all Kafka topics available
#   on the given Kafka broker.
#
# Prerequisites:
#   - Kafka broker running on localhost:9092
#   - kafka-topics.sh available in PATH
# ------------------------------------------------------

set -e

kafka-topics.sh --bootstrap-server localhost:9092 --list
