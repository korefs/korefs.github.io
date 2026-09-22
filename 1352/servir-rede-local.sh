#!/usr/bin/env bash

set -euo pipefail

PORTA="${1:-8000}"
PASTA_DO_SITE="$(cd "$(dirname "$0")" && pwd)"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Erro: o Python 3 não está instalado neste Mac."
  exit 1
fi

INTERFACE="$(route -n get default 2>/dev/null | awk '/interface:/{print $2; exit}')"
IP_LOCAL=""

if [[ -n "$INTERFACE" ]]; then
  IP_LOCAL="$(ipconfig getifaddr "$INTERFACE" 2>/dev/null || true)"
fi

if [[ -z "$IP_LOCAL" ]]; then
  IP_LOCAL="$(ifconfig 2>/dev/null | awk '
    /inet / && $2 != "127.0.0.1" && ($2 ~ /^192\.168\./ || $2 ~ /^10\./ || $2 ~ /^172\.(1[6-9]|2[0-9]|3[01])\./) {
      print $2
      exit
    }
  ')"
fi

if [[ -z "$IP_LOCAL" ]]; then
  echo "Erro: não encontrei um endereço de rede local."
  echo "Conecte o Mac ao Wi-Fi e execute o script novamente."
  exit 1
fi

echo
echo "============================================================"
echo "  Site disponível para aparelhos conectados à mesma rede:"
echo
echo "  http://${IP_LOCAL}:${PORTA}/"
echo
echo "  Mantenha esta janela aberta."
echo "  Para encerrar o servidor, pressione Control + C."
echo "============================================================"
echo

cd "$PASTA_DO_SITE"
exec python3 -m http.server "$PORTA" --bind 0.0.0.0
