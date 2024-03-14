FROM node:18-alpine as build

WORKDIR /next_js-app
COPY package.json ./
RUN npm install

FROM gcr.io/distroless/nodejs

COPY --from=build /next_js-app /
EXPOSE 3000
CMD ["index.js"]
