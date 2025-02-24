# 1. OpenJDK 21 사용
FROM openjdk:21-jdk-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. JAR 파일 복사
COPY build/libs/*.jar app.jar

# 4. 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]

# 5. 포트 설정
EXPOSE 8080
