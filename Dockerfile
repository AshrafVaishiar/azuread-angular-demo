FROM node:15.4 as build

WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npx run build

FROM nginx:1.19

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/azuread-angular-demo/ /usr/share/nginx/html