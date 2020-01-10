FROM ufoym/deepo:latest
RUN pip install --upgrade dask distributed
RUN pip install jupyter jupyterlab s3fs pyarrow awscli
RUN mkdir /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bash jupyter-setup.sh
EXPOSE 8786
EXPOSE 8787
EXPOSE 8080
CMD tail -f /dev/null