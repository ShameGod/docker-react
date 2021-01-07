FROM node:alpine
WORKDIR " /app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#no need to specify that this is a new block just a second from is enough
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
