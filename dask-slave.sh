#!/usr/bin/env bash
bash get-creds.sh &
dask-worker $@
