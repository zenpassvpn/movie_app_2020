FROM node:12 as builder
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:${PATH}/
COPY package*.json /usr/src/app/
# COPY ./package.json /usr/src/app/package.json
# COPY ./package-lock.json /usr/src/app/package-lock.json
RUN npm install --slient
COPY . /usr/src/app
RUN npm run build

# RUN ls /usr/src/app/build

FROM nginx:1.13.9-alpine
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 3000
CMD [ "nginx", "-g", "daemon off;" ]