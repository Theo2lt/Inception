# SPECIFIE LA DISTRIBUTION
FROM debian:10

RUN apt-get update

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y

# UDPATE & INSTALLATION
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out //etc/ssl/certs/nginx-selfsigned.crt \
            -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=TLIOT/UID=TTT'


RUN echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/snippets/self-signed.conf

RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048
COPY ./conf/ssl-params.conf /etc/nginx/snippets/

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

COPY ./conf/adminer.conf     /etc/nginx/sites-available/
COPY ./conf/subdomain.conf     /etc/nginx/sites-available/

RUN  ln -s /etc/nginx/sites-available/adminer.conf /etc/nginx/sites-enabled/
RUN  ln -s /etc/nginx/sites-available/subdomain.conf /etc/nginx/sites-enabled/


COPY ./conf/minecraft.conf /etc/nginx/modules-available/
RUN  ln -s /etc/nginx/modules-available/minecraft.conf /etc/nginx/modules-enabled/minecraft.conf
# PORT EXPOSE 
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
