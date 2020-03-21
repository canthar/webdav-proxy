FROM nginx:stable-alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY proxy.conf /
COPY entrypoint.sh /

CMD [ "/entrypoint.sh" ]
