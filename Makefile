VENV   = .venv
PIP    = $(VENV)/bin/pip3
PYLINT = $(VENV)/bin/pylint
PYTHON = $(VENV)/bin/python3
PYTEST = $(VENV)/bin/pytest

setup:
	python3 -m venv venv
	. venv/bin/activate

install:
	pip install --upgrade pip && pip install -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	chmod +x ./hadolint

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb

lint:
	./hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 ./src/app.py

all: install lint test