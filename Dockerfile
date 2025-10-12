# Dockerfile principal qui marche sur Railway
FROM kestra/kestra:latest

# Variables d'environnement pour Railway avec H2
ENV KESTRA_CONFIGURATION="kestra:\n  repository:\n    type: memory\n  storage:\n    type: local\n    local:\n      basePath: \"/app/storage\"\n  queue:\n    type: memory\n  tasks:\n    tmpDir:\n      path: /tmp/kestra-wd/tmp\n  url: http://localhost:8080/"

# Créer les répertoires
RUN mkdir -p /app/storage /tmp/kestra-wd/tmp

# Ports
EXPOSE 8080 8081

# Commande directe
CMD ["/usr/local/bin/docker-entrypoint.sh", "server", "standalone"]