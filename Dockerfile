# Etapa 1: Construcción (Build)
# Usamos una imagen de Node para instalar dependencias y construir el proyecto
FROM node:lts-alpine as build

WORKDIR /app

# Copiamos package.json y package-lock.json para instalar dependencias
COPY package*.json ./
RUN npm ci

# Copiamos el resto del código fuente y construimos la aplicación
COPY . .
RUN npm run build

# Etapa 2: Producción (Production)
# Usamos una imagen ligera de Nginx para servir los archivos estáticos
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]