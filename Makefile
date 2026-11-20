dev-up:
	podman compose -p weather-app-dev -f containers/compose.dev.yaml up --build -d

dev-start:
	podman compose -p weather-app-dev -f containers/compose.dev.yaml up --build -d

dev-stop:
	podman compose -p weather-app-dev -f containers/compose.dev.yaml stop

dev-down:
	podman compose -p weather-app-dev -f containers/compose.dev.yaml down

prod-up:
	podman compose -p weather-app-prod -f containers/compose.yaml up -d

prod-start:
	podman compose -p weather-app-prod -f containers/compose.yaml up -d

prod-stop:
	podman compose -p weather-app-prod -f containers/compose.yaml stop

prod-down:
	podman compose -p weather-app-prod -f containers/compose.yaml down
