FROM python:3.15-alpine

# Build Arguments
ARG APP_VERSION=MISSING
ENV APP_VERSION=${APP_VERSION}

# Dependencies
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN mkdir /logs

# Start App
WORKDIR /app
COPY requirements.txt .
COPY bin ./bin
COPY *.py .
COPY entrypoint.sh .
COPY setup.sh .
RUN chmod 755 ./*.sh && chown appuser:appgroup . -R; chmod 755 /logs && chown appuser:appgroup /logs -R
USER appuser
ENTRYPOINT ["./entrypoint.sh"]
CMD [".venv/bin/python", "app.py"]
