#!/usr/bin/env bash

PASTA="$(cd "$(dirname "$0")" && pwd)"
exec "$PASTA/servir-rede-local.sh"
