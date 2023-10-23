FROM node:16.10 AS build
WORKDIR /build
COPY package*.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:alpine
WORKDIR /app
COPY --from=build /build/build .
COPY nginx.conf /etc/nginx/nginx.conf