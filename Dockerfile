FROM openjdk:17-oracle

RUN useradd -m test
RUN echo "test:test" | chpasswd 

COPY ./app/target/*.jar /home/test/app/
RUN ls -l /home/test/app/

CMD ["java", "-jar", "/home/test/app/*.jar"]

