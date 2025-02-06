
all : start

start:
	@mkdir -p /home/kklockow/data/wp_volume
	@mkdir -p /home/kklockow/data/db_volume
	@cd srcs && docker compose up -d --build

stop:
	@cd srcs && docker compose down

