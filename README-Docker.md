# Docker Setup

## Levantar el Entorno

### Prerrequisitos
- Docker Desktop instalado
- Puertos 8080 y 5432 disponibles

### Comandos
```bash
# Levantar aplicación y base de datos
docker compose up -d

# Verificar que funciona
docker compose ps
curl http://localhost:8080/api/users/all

# Ver logs si hay problemas
docker compose logs -f spring_app

# Detener todo
docker compose down
```

### Acceso
- **Aplicación:** http://localhost:8080
- **Base de datos:** localhost:5432

### Usuarios de Prueba
- **USER:** `user` / `user123`
- **TECH:** `tech` / `tech123`