FROM node:18 AS builder

WORKDIR /app

COPY /demo-app /app

RUN npm install -g @angular/cli \
    && npm install
RUN npm run build

RUN chmod +x /app/entrypoint/entrypoint.sh

EXPOSE 4200

ENTRYPOINT ["/app/entrypoint/entrypoint.sh"]