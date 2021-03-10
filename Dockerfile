FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./main.py /app/main.py

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]
