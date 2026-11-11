FROM node:22-slim AS deps
WORKDIR /app

RUN corepack enable

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY backend/package.json ./backend/package.json
COPY frontend/package.json ./frontend/package.json

RUN pnpm install --frozen-lockfile

FROM deps AS dev
WORKDIR /app
COPY frontend/ ./frontend/
EXPOSE 5173
CMD ["pnpm", "--filter", "frontend", "dev", "--host", "0.0.0.0", "--port", "5173"]

FROM deps AS build
WORKDIR /app/frontend
COPY frontend/ ./
RUN pnpm build

FROM nginx:alpine AS prod
COPY --from=build /app/frontend/dist /usr/share/nginx/html
EXPOSE 80
