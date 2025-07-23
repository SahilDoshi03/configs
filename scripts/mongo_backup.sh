#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$HOME/Desktop/docs/syncmiddlewareBackup"
DB_NAME="syncmiddleware"
COLLECTION="syncconfigs"
MONGO_HOST="192.168.15.30"
MONGO_PORT="27017"

DUMP_PATH="$BACKUP_DIR/$DB_NAME-$TIMESTAMP"
JSON_EXPORT_PATH="$DUMP_PATH/$COLLECTION.json"

mkdir -p "$DUMP_PATH"

if mongoexport --host "$MONGO_HOST" --port "$MONGO_PORT" \
  --db "$DB_NAME" --collection "$COLLECTION" \
  --out "$JSON_EXPORT_PATH" --jsonArray; then
  notify-send 'Mongo Backup' 'Backup Created Successfully'
else
  notify-send 'Mongo Backup' '❌ Backup Failed'
  exit 1
fi

