#!/usr/bin/env bash
# Copia las plantillas del kit a una carpeta. Nunca pisa un archivo que ya existe.
#   ./instalar.sh                 # en la carpeta actual
#   ./instalar.sh ~/mi-taller     # en otra carpeta
set -euo pipefail
ORIGEN="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/plantillas"
DESTINO="${1:-$PWD}"
mkdir -p "$DESTINO"
for f in AGENTS.md CLAUDE.md PARA-CLAUDE.md BITACORA.md CONSTANTES.md README.md; do
  if [ -e "$DESTINO/$f" ]; then
    echo "  ya existe, no lo toco: $f"
  else
    cp "$ORIGEN/$f" "$DESTINO/$f"
    echo "  creado: $f"
  fi
done
echo "Listo en $DESTINO. Abre la carpeta con tu agente y pídele: \"arma el taller\" (o llena los <!-- --> a mano)."
