# Build stage
FROM node:22.9.0-alpine3.20 as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Production stage
FROM node:22.9.0-alpine3.20

WORKDIR /app

COPY --from=builder /app/.next ./.next

EXPOSE 3000

CMD ["npm", "run", "start"]