FROM ubuntu:20.04


RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

COPY ./requirements.txt /requirements.txt

WORKDIR /
ENV FLASK_RUN_HOST=0.0.0.0
RUN pip3 install -r requirements.txt

COPY . /

ENTRYPOINT [ "python3" ]

EXPOSE 5000

CMD [ "app.py" ]