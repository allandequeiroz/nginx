FROM nginx

MAINTAINER Allan de Queiroz <allandequeiroz@gmail.com>

# Install dependencies 
RUN apt-get update
RUN apt-get install vim curl -y

# Removing pre-defined configurations
RUN rm -fr /etc/nginx/conf.d/*

# Placing NGinx configurations
COPY conf/lab.conf /etc/nginx/conf.d
COPY conf/com.allandequeiroz.key /etc/ssl/
COPY conf/com.allandequeiroz.pem /etc/ssl/
COPY conf/registry.password /etc/nginx/conf.d/
