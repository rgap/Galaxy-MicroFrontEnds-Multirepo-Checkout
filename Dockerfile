FROM node:18-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY package.json ./

RUN grep -v '"mfe-common-components"' package.json > package.temp.json && \
    mv package.temp.json package.json

RUN pnpm install

COPY . .

EXPOSE 3003

CMD ["pnpm", "start"]
