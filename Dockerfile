FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -yqq && apt install software-properties-common curl zip unzip -y
RUN add-apt-repository ppa://ondrej/php -y
RUN apt install php7.3 php7.3-mysql php7.3-xml php7.3-ldap php7.3-zip php7.3-mbstring php7.3-json php7.3-opcache php7.3-gd php7.3-intl php7.3-bcmath php7.3-xdebug -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app
