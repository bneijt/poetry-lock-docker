FROM python:3-slim

WORKDIR /project

COPY dist/*.whl /project

RUN --mount=type=secret,id=pip_index_url \
    PIP_INDEX_URL=$(cat /run/secrets/pip_index_url) \
    pip install --no-cache-dir *.whl \
    && rm -rf *.whl

EXPOSE 8080

CMD ["python", "-m", "poetry_lock_docker"]
