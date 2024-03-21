FROM httpd:2.4 AS base

EXPOSE 80

FROM node:lts AS build
WORKDIR /app

COPY . .

RUN npm install -D \
  && npx pkg ./node_modules/@import-meta-env/cli/bin/import-meta-env.js \
    -t node18-linux-x64 \
    -o import-meta-env-linux \
  && npm run build

FROM base AS runtime
ENV SOME_VALUE=FESTUS
COPY --from=build /app/dist /usr/local/apache2/htdocs/
COPY --from=build /app/import-meta-env-linux /app/
COPY --from=build /app/.env.example.public /app/.env.example.public
COPY --from=build /app/start.sh /app/start.sh

CMD /app/start.sh