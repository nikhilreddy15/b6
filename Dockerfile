FROM openjdk as stage1
WORKDIR /source
COPY PrimeNumbers.java .
RUN javac PrimeNumbers.java

FROM ubuntu
WORKDIR /app
COPY  --from=stage1 /source/PrimeNumbers.class .
RUN apt-get update && apt-get install openjdk-18-jre-headless -y
CMD ["java",PrimeNumbers"]