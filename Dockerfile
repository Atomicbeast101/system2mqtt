FROM python:3.15-alpine

# Build Arguments
ARG APP_VERSION=0.0
ENV APP_VERSION=${APP_VERSION}

# Dependencies
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Start App
WORKDIR /app
COPY requirements.txt .
COPY bin ./bin
COPY *.py .
COPY entrypoint.sh .
COPY setup.sh .
RUN chmod 755 ./*.sh && chown appuser:appgroup . -R
USER appuser
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
CMD ["/app/.venv/bin/python", "app.py"]
