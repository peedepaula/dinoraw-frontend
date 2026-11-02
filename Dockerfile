# Etapa 1: Build (Compilação)
FROM node:18-alpine AS builder
WORKDIR /app
# Copia os arquivos de dependência
COPY package*.json ./
# Instala as dependências (axios, vue, vue-router, etc)
RUN npm install
# Copia o restante do código fonte
COPY . .
# Executa o "vue-cli-service build" para gerar a pasta /dist
RUN npm run build

# Etapa 2: Servidor Web de Produção (Nginx)
FROM nginx:alpine
# Copia os arquivos compilados da Etapa 1 para a pasta pública do Nginx
COPY --from=builder /app/dist /usr/share/nginx/html
# O Nginx roda internamente na porta 80
EXPOSE 80
# Inicia o servidor Nginx
CMD ["nginx", "-g", "daemon off;"]