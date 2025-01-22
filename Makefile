
all : start

start:
	@cd srcs && docker compose up -d --build