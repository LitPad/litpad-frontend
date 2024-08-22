ifneq (,$(wildcard ./.env))
include .env
export 
ENV_FILE_PARAM = --env-file .env

endif

dock-build:
	docker build -t lipad-web .
down:
	docker-compose down
run:
	docker run -d -p 3000:3000 --name lipad-web lipad-we
doc-build:
	docker-compose up -d --build
