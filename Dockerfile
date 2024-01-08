FROM openjdk:8
EXPOSE 8080
ADD target/devops_prjt.jar devops_prjt.jar
ENTRYPOINT ["java" , "-jar" , "/devops-prjt.jar"]
