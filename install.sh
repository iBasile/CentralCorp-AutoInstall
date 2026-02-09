#!/bin/bash

# site:
#     type: php
#     path: '{INSTALL_PATH_RELATIVE}'
#     php_version: '8.3'
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

cd "$INSTALL_PATH"

# Téléchargement avec fallback curl
if command -v wget > /dev/null; then
    wget -q -O installer.zip "https://github.com/CentralCorp/Installer/releases/latest/download/installer.zip"
elif command -v curl > /dev/null; then
    curl -L -o installer.zip "https://github.com/CentralCorp/Installer/releases/latest/download/installer.zip"
else
    echo "Erreur : wget ou curl requis."
    exit 1
fi

# Extraction directe dans INSTALL_PATH
unzip -oq installer.zip
rm installer.zip

chmod -R 755 "$INSTALL_PATH"

cd "$HOME"
rm -rf .config .local .subversion

echo "Installation terminée avec succès."
