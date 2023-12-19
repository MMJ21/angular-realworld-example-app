# Stage 1: Build from Node base image
FROM node:18 as build

WORKDIR /usr/local/app
COPY ./ /usr/local/app

RUN npm install --legacy-peer-deps
RUN npm run build


# Stage 2: Serve with NGINX
FROM nginx:latest
COPY --from=build /usr/local/app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80