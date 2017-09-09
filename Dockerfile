FROM java:8u111-jre

RUN mkdir /home/app
WORKDIR /home/app

ADD ./target/*.jar .

CMD java -jar docker-builder-image-1.0.0-SNAPSHOT.jar