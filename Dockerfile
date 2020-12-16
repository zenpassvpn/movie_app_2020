FROM node:12 as builder
# 앱 디렉터리 생성
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:${PATH}/
# 앱 의존성 설치
# 가능한 경우(npm@5+) package.json과 package-lock.json을 모두 복사하기 위해
# 와일드카드를 사용
COPY package*.json ./
# COPY package*.json /usr/src/app/
# COPY ./package.json /usr/src/app/package.json
# COPY ./package-lock.json /usr/src/app/package-lock.json
RUN npm install --slient
# 프로덕션을 위한 코드를 빌드하는 경우
# RUN npm ci --only=production

# 앱 소스 추가
COPY . .
# COPY . /usr/src/app
RUN npm run build

# RUN ls /usr/src/app/build

FROM nginx:1.13.9-alpine
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 3000
CMD [ "nginx", "-g", "daemon off;" ]