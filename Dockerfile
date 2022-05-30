FROM python:3.9

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r requirements.txt
# hadolint ignore=DL3013

COPY ./app /app/

EXPOSE 80

CMD ["python", "app.py"]