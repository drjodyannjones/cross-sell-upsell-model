install:
    poetry install

test:
    pytest

lint:
    black src tests

run:
    poetry run python src/serve_model.py
