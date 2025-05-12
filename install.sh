#!/usr/bin/env bash
set -euo pipefail

GGIT_SCRIPT_NAME="gcommit"
INSTALL_DIR="${HOME}/.local/bin"

mkdir -p "$INSTALL_DIR"

if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
  echo "⚠️ Attenzione: La directory '${INSTALL_DIR}' non è nel tuo PATH."
  echo "   Per usare '${GGIT_SCRIPT_NAME}' da qualsiasi terminale, aggiungi quanto segue al tuo file di configurazione della shell"
  echo "   (es. ~/.bashrc, ~/.zshrc, ~/.bash_profile):"
  echo ""
  echo "   export PATH=\"${INSTALL_DIR}:\$PATH\""
  echo ""
  echo "   Dovrai riavviare la tua shell o eseguire 'source ~/.bashrc' (o file equivalente) per applicare le modifiche."
fi

command -v git >/dev/null 2>&1 || { echo >&2 "❌ Errore: 'git' non trovato. Per favore, installalo."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "❌ Errore: 'jq' non trovato. Per favore, installalo."; exit 1; }
command -v gcloud >/dev/null 2>&1 || { echo >&2 "❌ Errore: 'gcloud' (Google Cloud CLI) non trovato. Per favore, installalo e configuralo."; exit 1; }

SCRIPT_SOURCE_PATH="$(dirname "$0")/${GGIT_SCRIPT_NAME}"

if [ ! -f "$SCRIPT_SOURCE_PATH" ]; then
    echo "❌ Errore: Lo script '${GGIT_SCRIPT_NAME}' non è stato trovato in '$(dirname "$0")'."
    echo "   Assicurati di eseguire install.sh dalla directory del repository clonata."
    exit 1
fi

cp "$SCRIPT_SOURCE_PATH" "${INSTALL_DIR}/${GGIT_SCRIPT_NAME}"
chmod +x "${INSTALL_DIR}/${GGIT_SCRIPT_NAME}"

echo "✅ '${GGIT_SCRIPT_NAME}' installato con successo in '${INSTALL_DIR}/${GGIT_SCRIPT_NAME}'."
echo ""
echo "➡️  Prossimi Passi:"
echo "   1. Assicurati che '${INSTALL_DIR}' sia nel tuo PATH (vedi messaggio precedente se necessario)."
echo "   2. Configura le variabili d'ambiente necessarie nel tuo file di configurazione della shell (es. ~/.bashrc, ~/.zshrc):"
echo "      export GGIT_PROJECT=\"IL_TUO_ID_PROGETTO_GCP\""
echo "      export GGIT_LOCATION=\"la-tua-region\"  # (opzionale, default: europe-west8)"
echo "      export GGIT_MODEL_ID=\"il-tuo-modello\" # (opzionale, default: gemini-2.0-flash-001)"
echo "   3. Ricarica la configurazione della tua shell (es. 'source ~/.bashrc') o apri un nuovo terminale."
echo "   4. Prova ad eseguire: ggit --help (o un commit vero e proprio in un repository git)"
echo ""
echo "   Per disinstallare, semplicemente rimuovi '${INSTALL_DIR}/${GGIT_SCRIPT_NAME}' e le variabili d'ambiente."

exit 0