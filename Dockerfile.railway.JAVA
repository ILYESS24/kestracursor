# Dockerfile qui utilise Java directement
FROM kestra/kestra:latest

# Trouver le JAR de Kestra
RUN find / -name "*.jar" | grep -i kestra

# Variables d'environnement
ENV KESTRA_CONFIGURATION="datasources:\n  postgres:\n    url: jdbc:postgresql://postgres:5432/kestra\n    driverClassName: org.postgresql.Driver\n    username: kestra\n    password: k3str4\nkestra:\n  repository:\n    type: postgres\n  storage:\n    type: local\n    local:\n      basePath: \"/app/storage\"\n  queue:\n    type: postgres\n  tasks:\n    tmpDir:\n      path: /tmp/kestra-wd/tmp\n  url: http://localhost:8080/"

# Créer les répertoires
RUN mkdir -p /app/storage /tmp/kestra-wd/tmp

# Ports
EXPOSE 8080 8081

# Commande Java directe (on va trouver le JAR)
CMD ["java", "-jar", "/app/kestra.jar", "server", "standalone"]
