FROM ubuntu:18.04

# Créer un utilisateur
RUN useradd -ms /bin/bash xtreamcodes

# Passer à l'utilisateur root pour l'installation des paquets
USER root

# Définir le répertoire de travail
WORKDIR /home/xtreamcodes

# Mettre à jour et installer les dépendances
RUN apt-get update && apt-get upgrade -y && apt-get install libxslt1-dev libcurl3 libgeoip-dev python wget -y

# Passer à l'utilisateur xtreamcodes pour les étapes suivantes
USER xtreamcodes

# Télécharger le fichier install.py depuis GitHub
RUN wget https://raw.githubusercontent.com/BourezBastien/xtream-ui-docker/refs/heads/main/install.py

# Exécuter les scripts Python
RUN python3 install itertools
RUN python install.py
