FROM python:3.6

WORKDIR /loader

COPY requirements.txt /loader/

RUN pip install -r requirements.txt

COPY src/* /loader/

CMD ["./entrypoint.sh"]
