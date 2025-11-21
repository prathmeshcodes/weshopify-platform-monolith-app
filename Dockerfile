# FROM openjdk:11
# RUN mkdir /app
# WORKDIR /app
# COPY we-shopify-platform.war $WORKDIR
# CMD [ "java","-jar","we-shopify-platform.war"]
# use a concrete, supported image tag
FROM openjdk:11-jdk-slim

# create app dir and set it as workdir
RUN mkdir -p /app
WORKDIR /app

# copy the built war from the build context (update path if different)
# when building, run from the project root so target/we-shopify-platform.war exists
COPY target/we-shopify-platform.war /app/we-shopify-platform.war

EXPOSE 8080

# run the war
CMD ["java", "-jar", "/app/we-shopify-platform.war"]

