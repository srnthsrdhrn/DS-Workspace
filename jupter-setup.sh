mkdir -p $HOME/.jupyter
HASHED_PASSWORD=`python -c "from notebook.auth import passwd; print(passwd('datascience'))"`
cat <<EOF >> $HOME/.jupyter/jupyter_notebook_config.py
c.NotebookApp.password = u'$HASHED_PASSWORD'
c.NotebookApp.open_browser = False
c.NotebookApp.ip = '0.0.0.0'
EOF
