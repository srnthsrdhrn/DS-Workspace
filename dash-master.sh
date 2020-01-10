dask-scheduler --port 8086 --dashboard-address :8787 &
dask-worker tcp://127.0.0.1:8086 &
jupyter lab --ip 0.0.0.0 --port 8080 --allow-root