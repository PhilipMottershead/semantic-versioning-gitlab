FROM python:3.11-slim-bookworm

RUN set -ex \
    \
    && apt-get -y upgrade \
    && apt-get -y update \
    && apt-get -y install git \
    && apt-get clean

WORKDIR /semver

COPY /requirements.txt .

RUN pip install -r requirements.txt

COPY /bump-version.py .

CMD ["python", "/bump-version.py"]