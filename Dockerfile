FROM docker.io/bitpoke/wordpress-runtime:bedrock-build as builder
FROM docker.io/bitpoke/wordpress-runtime:bedrock
COPY --from=builder --chown=www-data:www-data /app /app
