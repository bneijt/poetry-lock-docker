FROM python:3-slim

WORKDIR /project

COPY dist/*.whl */dist/*.whl /project

RUN pip install --no-cache-dir *.whl \
    && rm -rf *.whl

EXPOSE 8080

CMD ["python", "-m", "poetry_lock_docker"]
