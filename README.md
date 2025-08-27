# gcommit 🚀

`gcommit` is a command-line tool that leverages Google Cloud's AI models (specifically Gemini) to generate concise, well-formatted Git commit messages that adhere to Conventional Commits standards. It automates the creation of commit messages based on your staged changes.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

## How to Use

1.  **Stage your changes:**
    In your Git repository, add the files you want to include in the commit:
    ```bash
    git add .
    # or
    git add <specific_files>
    ```

2.  **Run `gcommit`:**
    Make sure you have [installed](#installation) and [configured](#configuration) `gcommit`.
    ```bash
    gcommit
    ```

3.  **Confirm the message:**
    `gcommit` will display the generated commit message and ask for your confirmation.
    ```
    ✨ Generated commit message:

    feat: PROJ-123 implement user authentication flow

    Use this commit message? [Y/n]:
    ```
    Press `Y` (or Enter) to proceed with the commit, or `n` to cancel.

4.  **Forward arguments to `git commit`:**
    You can pass arguments directly to `git commit` after `gcommit`. For example, to sign a commit with GPG:
    ```bash
    gcommit -S
    ```
    Or to add a longer description (opening the editor):
    ```bash
    gcommit -v
    ```

## Key Features

* ✨ **AI-Generated Commit Messages:** Uses Google Cloud's Gemini models to create intelligent commit messages.
* 🏷️ **Ticket ID Extraction:** Automatically extracts ticket IDs (e.g., `PROJ-123`) from the branch name and prepends them to the message.
* 🧠 **Context-Aware:** Considers recent commit history and the files being modified.
* convention **Conventional Commits:** Generates messages that follow the [Conventional Commits](https://www.conventionalcommits.org/) standard.
* 📏 **Concise and Formatted:** Produces single-line messages, under 72 characters, in the imperative mood.
* 🔧 **Configurable:** Set your Google Cloud project, region, and model ID via environment variables.
* 💬 **Interactive Confirmation:** Asks for your approval before committing.
* passthrough **Argument Forwarding:** Allows you to forward additional arguments to the `git commit` command (e.g., `gcommit -S` to sign the commit).
* 🐛 **Debug Mode:** Includes a `--debug` mode to inspect the prompt sent to the AI and its response.

## Prerequisites

Before installing `gcommit`, ensure you have:

* **Git:** Installed and configured.
* **jq:** Installed (e.g., `sudo apt install jq` or `brew install jq`).
* **Google Cloud SDK (`gcloud`):** Installed and [configured](https://cloud.google.com/sdk/docs/initializing). You must be authenticated (`gcloud auth login`) and have a default project configured (`gcloud config set project YOUR_PROJECT_ID`).
* **Google Cloud Project:**
    * The Vertex AI API must be [enabled](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
    * Billing must be configured for the project.

## Installation

1.  **Clone the repository (if you haven't already):**
    ```bash
    git clone <YOUR_REPOSITORY_URL>
    cd <REPOSITORY_FOLDER_NAME> # e.g., cd gcommit
    ```

2.  **Run the installation script:**
    ```bash
    bash install.sh
    ```
    This script will copy `gcommit` to `~/.local/bin` and make it executable. Follow the instructions provided by the script if `~/.local/bin` is not in your `PATH`.

## Configuration

`gcommit` uses the following environment variables:

* `GGIT_PROJECT`: **(Required)** Your Google Cloud project ID.
* `GGIT_LOCATION`: (Optional) The region for AI API calls. Default: `europe-west8`.
* `GGIT_MODEL_ID`: (Optional) The Gemini model ID to use. Default: `gemini-2.0-flash-001`.

Add these variables to your shell's configuration file (e.g., `~/.bashrc`, `~/.zshrc`):

```bash
export GGIT_PROJECT="YOUR_GCP_PROJECT_ID"
# export GGIT_LOCATION="your-region" # Optional
# export GGIT_MODEL_ID="your-gemini-model" # Optional