FROM node:alpine AS build
WORKDIR /app
COPY package.json .
RUN npm config set strict-ssl false
RUN npm install --verbose
COPY . .
CMD [ "yarn", "build" ]


FROM nginx
COPY --from=build /app/build /usr/share/nginx/html