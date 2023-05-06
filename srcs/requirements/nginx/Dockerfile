# SPECIFIE LA DISTRIBUTION
FROM debian:buster

RUN apt-get update && apt-get upgrade -y 

# FOR DEBUGIN
RUN apt install -y iputils-ping vim 

# UDPATE & INSTALLATION
RUN apt-get install -y nginx openssl

RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
            -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=TLIOT/UID=TTT'

RUN echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/snippets/self-signed.conf

RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048
COPY ./conf/ssl-params.conf /etc/nginx/snippets/


COPY ./conf/default    /etc/nginx/sites-available/
COPY ./conf/adminer.conf    /etc/nginx/sites-available/
COPY ./conf/subdomain.conf  /etc/nginx/sites-available/

RUN  ln -s /etc/nginx/sites-available/adminer.conf /etc/nginx/sites-enabled/
RUN  ln -s /etc/nginx/sites-available/subdomain.conf /etc/nginx/sites-enabled/

COPY ./conf/minecraft.conf /etc/nginx/modules-available/
RUN  ln -s /etc/nginx/modules-available/minecraft.conf /etc/nginx/modules-enabled/minecraft.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
