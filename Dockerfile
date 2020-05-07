FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -yqq && apt install software-properties-common curl zip unzip -y
RUN add-apt-repository ppa://ondrej/php -y
RUN apt install php7.4 php7.4-curl php7.4-mysql php7.4-xml php7.4-ldap php7.4-zip php7.4-mbstring php7.4-json php7.4-opcache php7.4-gd php7.4-intl php7.4-bcmath php7.4-xdebug -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app
