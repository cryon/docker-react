FROM node:alpine AS builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# ---

FROM nginx AS web

COPY --from=builder /app/build /usr/share/nginx/html
