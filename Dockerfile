FROM quay.io/presslabs/wordpress-runtime:bedrock-build as builder
FROM quay.io/presslabs/wordpress-runtime:bedrock
COPY --from=builder --chown=www-data:www-data /app /app
