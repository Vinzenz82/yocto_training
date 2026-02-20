# VS Code Docker Container

Ein Docker Image mit VS Code (code-server), das über den Browser zugänglich ist.

## Vorbereitung

- Docker installieren: https://docs.docker.com/get-docker/
- Docker Compose installieren (optional, aber empfohlen)
- https://stackoverflow.com/questions/48957195/how-to-fix-docker-permission-denied
- 
## Image bauen und starten

### Option 1: Mit Docker Compose (empfohlen)

```bash
docker-compose up -d
```

### Option 2: Mit Docker

```bash
# Image bauen
docker build -t vscode-image .

# Container starten
docker run -d \
  --name vscode-container \
  -p 8080:8080 \
  -e PASSWORD=vscode123 \
  -v $(pwd)/workspace:/home/coder/workspace \
  vscode-image
```

## Zugriff

1. Öffne den Browser: http://localhost:8080
2. Passwort eingeben: `vscode123`
3. Fertig! VS Code ist einsatzbereit

## Weitere Optionen

### Benutzerdefinierten Zugang setzen

Ändere in `docker-compose.yml` die `PASSWORD` Variable:

```yaml
environment:
  - PASSWORD=dein_passwort
```

### Persistente Daten

Der Ordner `./workspace` wird automatisch mit dem Container synchronisiert. Alle Dateien dort bleiben auch nach einem Neustart erhalten.

### Container stoppen

```bash
docker-compose down
```

## Zusätzliche Tools im Image

- Git
- Node.js & npm
- Python 3 & pip
- Build tools

Diese können je nach Bedarf in der Dockerfile erweitert werden.
