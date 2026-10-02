FROM ghcr.io/cirruslabs/flutter:stable

WORKDIR /workspace

RUN flutter config --enable-web --no-analytics

EXPOSE 8080

CMD ["sleep", "infinity"]
