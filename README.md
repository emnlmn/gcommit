# gcommit 🚀

`gcommit` è uno strumento da riga di comando che sfrutta i modelli AI di Google Cloud (specificamente Gemini) per generare messaggi di commit Git concisi, ben formattati e conformi agli standard dei Conventional Commits. Automatizza la creazione dei messaggi di commit basandosi sulle modifiche preparate (staged).

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

## Come Usare

1.  **Prepara le modifiche (stage):**
    Nel tuo repository Git, aggiungi i file che vuoi includere nel commit:
    ```bash
    git add .
    # oppure
    git add <file_specifici>
    ```

2.  **Esegui `gcommit`:**
    Assicurati di aver [installato](#installazione) e [configurato](#configurazione) `gcommit`.
    ```bash
    gcommit
    ```

3.  **Conferma il messaggio:**
    `gcommit` mostrerà il messaggio di commit generato e ti chiederà conferma.
    ```
    ✨ Generated commit message:

    feat: PROJ-123 implement user authentication flow

    Use this commit message? [Y/n]:
    ```
    Premi `Y` (o Invio) per procedere con il commit, o `n` per annullare.

4.  **Inoltrare argomenti a `git commit`:**
    Puoi passare argomenti direttamente a `git commit` dopo `gcommit`. Ad esempio, per firmare un commit con GPG:
    ```bash
    gcommit -S
    ```
    Oppure per aggiungere una descrizione più lunga (aprendo l'editor):
    ```bash
    gcommit -v
    ```

## Caratteristiche Principali

* ✨ **Messaggi di Commit Generati da AI:** Utilizza i modelli Gemini di Google Cloud per creare messaggi di commit intelligenti.
* 🏷️ **Estrazione ID Ticket:** Estrae automaticamente ID di ticket (es. `PROJ-123`) dal nome del branch e li antepone al messaggio.
* 🧠 **Consapevolezza del Contesto:** Considera la cronologia recente dei commit e i file modificati.
* convention **Conventional Commits:** Genera messaggi che seguono lo standard dei [Conventional Commits](https://www.conventionalcommits.org/).
* 📏 **Conciso e Formattato:** Produce messaggi di una sola riga, sotto i 72 caratteri, in forma imperativa.
* 🔧 **Configurabile:** Imposta il tuo progetto Google Cloud, la region e l'ID del modello tramite variabili d'ambiente.
* 💬 **Conferma Interattiva:** Richiede la tua approvazione prima di effettuare il commit.
* पास **Inoltro Argomenti:** Permette di inoltrare argomenti aggiuntivi al comando `git commit` (es. `gcommit -S` per firmare il commit).
* 🐛 **Modalità Debug:** Include una modalità `--debug` per ispezionare il prompt inviato all'AI e la risposta.

## Prerequisiti

Prima di installare `gcommit`, assicurati di avere:

* **Git:** Installato e configurato.
* **jq:** Installato (es. `sudo apt install jq` o `brew install jq`).
* **Google Cloud SDK (`gcloud`):** Installato e [configurato](https://cloud.google.com/sdk/docs/initializing). Devi autenticarti (`gcloud auth login`) e aver configurato un progetto predefinito (`gcloud config set project YOUR_PROJECT_ID`).
* **Progetto Google Cloud:**
    * L'API Vertex AI deve essere [abilitata](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
    * La fatturazione deve essere configurata per il progetto.

## Installazione

1.  **Clona il repository (se non l'hai già fatto):**
    ```bash
    git clone <URL_DEL_TUO_REPOSITORY>
    cd <NOME_DELLA_CARTELLA_DEL_REPOSITORY> # es. cd gcommit
    ```

2.  **Esegui lo script di installazione:**
    ```bash
    bash install.sh
    ```
    Questo script copierà `gcommit` in `~/.local/bin` e lo renderà eseguibile. Segui le istruzioni fornite dallo script se `~/.local/bin` non è nel tuo `PATH`.

## Configurazione

`gcommit` utilizza le seguenti variabili d'ambiente:

* `GGIT_PROJECT`: **(Obbligatoria)** L'ID del tuo progetto Google Cloud.
* `GGIT_LOCATION`: (Opzionale) La region per le chiamate API AI. Default: `europe-west8`.
* `GGIT_MODEL_ID`: (Opzionale) L'ID del modello Gemini da utilizzare. Default: `gemini-2.0-flash-001`.

Aggiungi queste variabili al file di configurazione della tua shell (es. `~/.bashrc`, `~/.zshrc`):

```bash
export GGIT_PROJECT="IL_TUO_ID_PROGETTO_GCP"
# export GGIT_LOCATION="la-tua-region" # Opzionale
# export GGIT_MODEL_ID="il-tuo-modello-gemini" # Opzionale