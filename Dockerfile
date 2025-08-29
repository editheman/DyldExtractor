FROM python:3.10-slim AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/dyldextractor

COPY setup.py setup.cfg pyproject.toml ./

COPY src/DyldExtractor ./src/DyldExtractor

RUN pip install --no-cache-dir -e .

COPY . .

ENTRYPOINT ["dyldex"]

CMD ["--help"]
