#
# Build
#
FROM openjdk:8-jdk AS build

RUN apt-get update && apt-get -y install maven

WORKDIR /opt/shipping

COPY pom.xml /opt/shipping/
RUN mvn install

COPY src /opt/shipping/src/
RUN mvn package

#
# Run
#
FROM openjdk:8-jdk

EXPOSE 8080

WORKDIR /opt/shipping

COPY --from=build /opt/shipping/target/shipping-1.0-jar-with-dependencies.jar shipping.jar
RUN \
  mkdir /opt/newrelic && \
  wget -O /opt/newrelic/newrelic.jar http://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic.jar && \
  wget -O /opt/newrelic/newrelic.yml http://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic.yml
CMD [ "java", "-javaagent:/opt/newrelic/newrelic.jar", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]
