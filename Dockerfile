FROM python:3.9

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

# hadolint ignore=DL3013
RUN pip install --upgrade pip && pip install --trusted-host pypi.python.org -r requirements.txt


COPY ./app /app/

EXPOSE 80

CMD ["python", "app.py"]