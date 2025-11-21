# FROM openjdk:11
# RUN mkdir /app
# WORKDIR /app
# COPY we-shopify-platform.war $WORKDIR
# CMD [ "java","-jar","we-shopify-platform.war"]
# use a concrete, supported image tag
FROM eclipse-temurin:11-jdk

LABEL maintainer="you@example.com"
LABEL description="WeShopify Platform - packaged WAR runtime"

# Create application directory and set it as workdir
RUN mkdir -p /app
WORKDIR /app

# Copy the built WAR into the image.
# Make sure your CI/CD creates: target/we-shopify-platform.war
COPY we-shopify-platform.war /app/we-shopify-platform.war

# Expose application port
EXPOSE 8080

# Optional healthcheck
# HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
#   CMD curl -f http://localhost:8080/ || exit 1

# Run the WAR
CMD ["java", "-jar", "/app/we-shopify-platform.war"]


