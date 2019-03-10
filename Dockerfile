FROM ubuntu:18.04

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update

RUN apt install software-properties-common -y

RUN add-apt-repository ppa://ondrej/php -y && add-apt-repository ppa://ondrej/apache2 -y

RUN apt install php7.2 php7.2-mysql php7.2-mbstring php7.2-xml php7.2-zip apache2 -y
