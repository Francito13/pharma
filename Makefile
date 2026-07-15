.PHONY: build up down test migrate backup restore logs shell

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

test:
	docker compose run --rm django pytest

migrate:
	docker compose run --rm django python manage.py migrate

backup:
	@powershell -ExecutionPolicy Bypass -File scripts/backup_db.ps1 -ContainerName $(or $(CONTAINER),b2b-postgres-1)

restore:
	@echo "Usage: make restore FILE=backup_file.sql"
	@echo "cat $(FILE) | docker exec -i $(or $(CONTAINER),b2b-postgres-1) psql -U pharma -d pharmab2b"

logs:
	docker compose logs -f

shell:
	docker compose run --rm django python manage.py shell

migrations:
	docker compose run --rm django python manage.py makemigrations

superuser:
	docker compose run --rm django python manage.py createsuperuser

collectstatic:
	docker compose run --rm django python manage.py collectstatic --noinput
