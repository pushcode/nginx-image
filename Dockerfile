FROM pushcode/ubuntu

RUN apt-get update -q && \
    apt-get install -yq --no-install-recommends \
        nginx-light && \

    # Cleanup
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log

ADD default.conf /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf

RUN mkdir /var/www
RUN echo "<h1>Nginx up</h1>" > /var/www/index.html
