FROM node:22-slim AS deps
WORKDIR /app

RUN corepack enable

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY backend/package.json ./backend/package.json
COPY frontend/package.json ./frontend/package.json

RUN pnpm install --frozen-lockfile

FROM deps AS dev
COPY backend/ ./backend/
EXPOSE 3001
CMD ["pnpm", "--filter", "backend", "dev"]

FROM deps AS build
WORKDIR /app/backend
COPY ./backend ./
RUN pnpm build

FROM node:22 AS prod
WORKDIR /app

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY backend/package.json ./backend/package.json
COPY frontend/package.json ./frontend/package.json

COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/backend/node_modules ./backend/node_modules
COPY --from=build /app/backend/dist ./backend/dist

WORKDIR /app/backend
EXPOSE 3000
CMD ["node", "dist/index.js"]
