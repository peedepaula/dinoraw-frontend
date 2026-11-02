# Etapa 1: Build (Compilação)
FROM node:18-alpine AS builder
WORKDIR /app
# Copia os arquivos de dependência
COPY package*.json ./
# Instala as dependências (axios, vue, vue-router, etc)
RUN npm install
# Copia o restante do código fonte
COPY . .
RUN npm run build

# Executa o "vue-cli-service build" para gerar a pasta /dist
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html/dinoraw
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]