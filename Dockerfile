FROM ufoym/deepo:latest
RUN mkdir /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r requirements.txt
RUN bash jupyter-setup.sh
EXPOSE 8086
EXPOSE 8787
EXPOSE 8080
CMD python main.py
