#APP
FROM node:18 AS builder

WORKDIR /app

COPY /app/demo-app /app

ARG PROFILE
ENV PROFILE $PROFILE

RUN echo "Environment: ${PROFILE}"
RUN npm build-${PROFILE}

RUN chmod +x /entrypoint/entrypoint.sh

EXPOSE 4200

ENTRYPOINT ["/entrypoint/entrypoint.sh"]