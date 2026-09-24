### Как запустить проект после скачивания:

1. Запустите контейнеры:
```bash
docker-compose up -d
```

2. Установите все зависимости (папку vendor):
```bash
docker-compose exec web composer install
```
