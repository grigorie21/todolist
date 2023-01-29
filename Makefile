ifneq (,$(wildcard ./.env))
    include .env
    export
endif

ifneq ("$(wildcard ./crm-consumer.pid)","")
    kill_crm_command := kill -15 $(shell cat crm-consumer.pid)
else
    kill_crm_command := ''
endif

ifneq ("$(wildcard ./sms-consumer.pid)","")
    kill_sms_command := kill -15 $(shell cat sms-consumer.pid)
else
    kill_sms_command := ''
endif

ifneq ("$(wildcard ./websockets.pid)","")
    kill_ws_command := kill -15 $(shell cat websockets.pid)
else
    kill_ws_command := ''
endif


.PHONY: all
all: build run

.PHONY: restart
restart: down run

.PHONY: down
down:
	@echo '-------------------------------------------------------'
	@echo '➤ Stop containers...'
	@echo '-------------------------------------------------------'
	@docker-compose down
	@echo '-------------------------------------------------------'
	@echo '✓ Done.'
	@echo '-------------------------------------------------------'

.PHONY: build
build:
	@echo '-------------------------------------------------------'
	@echo '➤ Start build...'
	@echo '-------------------------------------------------------'
	@docker run --rm -u "$(shell id -u):$(shell id -g)" -v $(shell pwd):/var/www/html -w $(shell pwd):/var/www/default/htdocs composer install --ignore-platform-reqs
	@echo '-------------------------------------------------------'
	@echo '✓ Done.'
	@echo '-------------------------------------------------------'


.PHONY: refresh-db
refresh-db:
	@echo '-------------------------------------------------------'
	@echo '➤ Start refresh...'
	@echo '-------------------------------------------------------'
	@docker exec -ti sms-php php artisan migrate:fresh
	@docker exec -ti sms-php php artisan db:seed
	@echo '-------------------------------------------------------'
	@echo '✓ Done.'
	@echo '-------------------------------------------------------'


.PHONY: up
up:
	@echo '-------------------------------------------------------'
	@echo '➤ Start containers...'
	@echo '-------------------------------------------------------'
	@docker-compose up -d
	@echo '-------------------------------------------------------'
	@echo '✓ Done'
	@echo '-------------------------------------------------------'

.PHONY: generate-key
generate-key:
	@echo '-------------------------------------------------------'
	@echo '➤ Generate laravel key...'
	@echo '-------------------------------------------------------'
	@docker exec -ti sms-php php artisan key:generate
	@echo '-------------------------------------------------------'
	@echo '✓ Done'
	@echo '-------------------------------------------------------'

.PHONY: migrate
migrate:
	@echo '-------------------------------------------------------'
	@echo '➤ Run migrations...'
	@echo '-------------------------------------------------------'
	@docker exec -ti sms-php php artisan migrate:fresh
	@echo '-------------------------------------------------------'
	@echo '✓ Done'
	@echo '-------------------------------------------------------'

.PHONY: seed
seed:
	@echo '-------------------------------------------------------'
	@echo '➤ Seed db...'
	@echo '-------------------------------------------------------'
	@docker exec -ti sms-php php artisan db:seed
	@echo '-------------------------------------------------------'
	@echo '✓ Done'
	@echo '-------------------------------------------------------'

.PHONY: npm-dev
npm-dev:
	@echo '-------------------------------------------------------'
	@echo '➤ Run npm...'
	@echo '-------------------------------------------------------'
	@docker exec -ti sms-php npm run dev
	@echo '-------------------------------------------------------'
	@echo '✓ Done'
	@echo '-------------------------------------------------------'

.PHONY: restart-ws-server
restart-ws-server: stop-ws-server start-ws-server

.PHONY: restart-sms-consumer
restart-crm-consumer: stop-sms-consumer start-sms-consumer

.PHONY: start-horizon
start-horizon:
	@echo '-------------------------------------------------------'
	@echo '➤ Start horizon...'
	@echo '-------------------------------------------------------'
	@touch horizon.log
	@docker exec sms-php /bin/bash -c 'nohup php artisan horizon > horizon.log 2>&1 &'
	@echo '-------------------------------------------------------'
	@echo '✓ Done'
	@echo '-------------------------------------------------------'

.PHONY: stop-horizon
stop-horizon:
	@echo '-------------------------------------------------------'
	@echo '➤ Stop horizon...'
	@echo '-------------------------------------------------------'
	@docker exec -ti sms-php php artisan horizon:terminate
	@echo '-------------------------------------------------------'
	@echo '✓ Done.'
	@echo '-------------------------------------------------------'

.PHONY: restart-horizon
restart-horizon: stop-horizon start-horizon

.PHONY: restart-workers
restart-workers: stop-workers start-workers

.PHONY: start-workers
start-workers: start-horizon start-ws-server

.PHONY: stop-workers
stop-workers: stop-horizon stop-ws-server

.PHONY: run
run: up start-workers

.PHONY: clean-run
clean-run: up generate-key migrate seed npm-dev create-queues start-workers
