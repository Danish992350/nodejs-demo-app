# Stage 1: Build
FROM node:18 as build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --production
COPY . .

# Stage 2: Production
FROM node:18-slim

WORKDIR /usr/src/app
COPY --from=build /usr/src/app /usr/src/app

COPY .env .env
EXPOSE 3000

CMD ["npm", "start"]
