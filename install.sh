#!/bin/bash

# site:
#     type: php
#     path: '{INSTALL_PATH_RELATIVE}/www'
#     php_version: '8.3'
# database:
#     type: mysql
# requirements:
#     disk: 50
# form:
#     site_name:
#         label:
#             fr: Nom du site
#             en: Site name
#         max_length: 255
#     admin_email:
#         type: email
#         label:
#             fr: Email administrateur
#             en: Administrator email
#         max_length: 255

set -e

# Création du dossier www si inexistant
mkdir -p "$INSTALL_PATH/www"

cd "$INSTALL_PATH/www"

# Téléchargement de l'archive
wget -O installer.zip "https://github.com/CentralCorp/Installer/releases/latest/download/installer.zip"

# Extraction directement dans www
unzip installer.zip

# Suppression de l'archive
rm installer.zip

# Ajustement des permissions (sécurisé)
chmod -R 755 "$INSTALL_PATH/www"
