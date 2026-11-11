dev-up:
	podman compose -p weather-app-dev -f compose.dev.yml --env-file .env.development up --build -d

dev-start:
	podman compose -p weather-app-dev -f compose.dev.yml --env-file .env.development up --build -d

dev-stop:
	podman compose -p weather-app-dev stop

dev-down:
	podman compose -p weather-app-dev -f compose.dev.yml down

prod-up:
	podman compose -p weather-app-prod -f compose.prod.yml --env-file .env up --build -d

prod-start:
	podman compose -p weather-app-prod -f compose.prod.yml --env-file .env up --build -d

prod-stop:
	podman compose -p weather-app-prod stop

prod-down:
	podman compose -p weather-app-prod -f compose.prod.yml down
