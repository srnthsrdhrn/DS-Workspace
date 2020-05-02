#!/usr/bin/env bash
dask-scheduler --port 8086 --dashboard-address :8787 &
bash get-creds.sh &
jupyter lab --ip 0.0.0.0 --port 8080 --allow-root
