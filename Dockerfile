FROM python:3.15-alpine

# Build Arguments
ARG APP_VERSION=0.0
ENV APP_VERSION=${APP_VERSION}

# Dependencies
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Start App
WORKDIR /app
COPY requirements.txt /app
COPY bin /app/bin
COPY *.py /app
COPY entrypoint.sh /app
COPY setup.sh /app
RUN chmod +x /app/*.sh && chown appuser:appgroup /app -R
RUN ls -ls /
RUN ls -ls /app
USER appuser
ENTRYPOINT ["/app/entrypoint.sh"]
CMD [".venv/bin/python", "app.py"]
