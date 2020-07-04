mvn package  -DskipTests
java -jar target/*.jar -Dhibernate_username=test
