#!/bin/sh

# Load environment variables
DIR=$(dirname "$0")
if [ -f "${DIR}/.env" ]; then
  set -a
  . "${DIR}/.env"
  set +a
fi

FILETYPES=("Ks" "Bac" "Kta" "Ukc" "Kyi")

cat <<EOS

Filedate? (ex. 220319)
yymmdd の形式で入力してください。
EOS

read FILEDATE

for FILETYPE in "${FILETYPES[@]}"
do
sh $(dirname $0)/downloader.sh << EOS
${FILETYPE}
${FILEDATE}
EOS
done
