FROM node:20-alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:stable-alpine
COPY --from=build /app/dist/blog/browser /usr/share/nginx/html
EXPOSE 80