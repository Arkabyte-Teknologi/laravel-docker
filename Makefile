up:
	docker compose up -d 
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
down-v:
	docker-compose down --remove-orphans --volumes
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-web:
	docker-compose logs web
log-web-watch:
	docker-compose logs --follow web
log-app:
	docker-compose logs app
log-app-watch:
	docker-compose logs --follow app
web:
	docker-compose exec web bash
app:
	docker-compose exec app bash
migrate:
	docker-compose exec app php artisan migrate
fresh:
	docker-compose exec app php artisan migrate:fresh --seed
seed:
	docker-compose exec app php artisan db:seed
dacapo:
	docker-compose exec app php artisan dacapo
rollback-test:
	docker-compose exec app php artisan migrate:fresh
	docker-compose exec app php artisan migrate:refresh
tinker:
	docker-compose exec app php artisan tinker
test:
	docker-compose exec app php artisan test
optimize:
	docker-compose exec app php artisan optimize
optimize-clear:
	docker-compose exec app php artisan optimize:clear
cache:
	docker-compose exec app composer dump-autoload -o
	@make optimize
	docker-compose exec app php artisan event:cache
	docker-compose exec app php artisan view:cache
cache-clear:
	docker-compose exec app composer clear-cache
	@make optimize-clear
	docker-compose exec app php artisan event:clear

init:
	@make generate-ssl
	docker compose up -d --build
	docker compose exec app composer install
	docker compose exec app cp .env.example .env
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache
	
init-fresh:
	@make init
	@make fresh

generate-ssl:
	 ./init-letsencrypt.sh