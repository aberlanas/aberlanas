#!/bin/bash


# This script is licensed under GPL v3 or higher
# Author: Angel Berlanas Vicente
# email : a.berlanasvicente@edu.gva.es 

TELEGRAM_DOWNLOAD_PATH="/home/aberlanas/Descargas/Telegram Desktop/"
TELEGRAM_BINARY_PATH="/home/aberlanas/bin/Telegram/Telegram"
GAMES_PATH="/home/aberlanas/Documentos/Juegos/"
VASSAL_BINARY="vassal-3.6.6"

echo " * Cleaning Telegram "
rm -rf "${TELEGRAM_DOWNLOAD_PATH}"/*.vlog

echo " * Launching Telegram "
${TELEGRAM_BINARY_PATH} & 


echo " * Nautilus opening folders"
nautilus "${TELEGRAM_DOWNLOAD_PATH}" &
nautilus "${GAMES_PATH}" & 

echo " * Vassal binary" 
${VASSAL_BINARY} 

exit 0
