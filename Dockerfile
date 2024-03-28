FROM openjdk:17-oracle

RUN useradd -m test
RUN echo "test:test" | chpasswd 

#copy maven built target jar to /home/test/app/
RUN mkdir /home/test/app/
COPY ./app/target/*.jar /home/test/app/
#check that file is copied
RUN ls -l /home/test/app/

CMD ["java", "-jar", "/home/test/app/*.jar"]

