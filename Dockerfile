FROM oven/bun:latest

WORKDIR /app

COPY package.json .
COPY bun.lockb .

RUN bun install

COPY . .

# Construir la aplicación
RUN bun run build

# Limpiar dependencias de desarrollo
RUN rm -rf node_modules && \
    bun install --production

ENV PORT=4000
EXPOSE 4000

# Ejecutar la versión compilada con puerto específico
CMD ["bun", "--port", "4000", "dist/index.js"]