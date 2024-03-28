FROM openjdk:17-oracle

RUN useradd -m test
RUN echo "test:test" | chpasswd 

COPY ./app/lab2q3-0.0.1-SNAPSHOT.jar /home/test/app/

CMD ["java", "-jar", "/home/test/app/lab2q3-0.0.1-SNAPSHOT.jar"]

