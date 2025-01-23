
all : start

start:
	@mkdir -p /Users/kklockow/home/kklockow/data/wp_volume
	@mkdir -p /Users/kklockow/home/kklockow/data/db_volume
	@cd srcs && docker compose up -d --build

# clean:
# 	@rm -rf /Users/kklockow/home/kklockow/data/wp_volume
# 	@rm -rf /Users/kklockow/home/kklockow/data/db_volume
# 	@cd srcs && docker compose down --volumes --remove-orphans