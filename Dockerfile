# 1차 스테이지: 의존성만 설치
FROM node:18-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production

# 최종 스테이지: 코드와 node_modules 복사, 실행 준비
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app ./ 
EXPOSE 3000
CMD ["node", "server.js"]