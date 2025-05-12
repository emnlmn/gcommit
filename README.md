# gcommit

`gcommit` is a command-line tool that leverages Google Cloud's AI models (specifically, the Gemini family) to generate concise and well-formatted commit messages based on your staged changes.  It aims to streamline your commit workflow by automating the creation of commit messages that adhere to conventional commit standards.

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

## Features

*   **AI-Powered Commit Messages:**  Generates commit messages using Google Cloud's Gemini models, ensuring conciseness and adherence to conventional commit formats.
*   **Ticket ID Extraction:** Automatically extracts ticket IDs from your branch name (e.g., ABC-1234) and prepends them to the commit message.
*   **Contextual Awareness:**  Considers recent commit history and changed files when generating commit messages.
*   **Customizable:** Allows you to configure the Google Cloud Project ID, location, and model ID via environment variables.
*   **Debug Mode:** Provides a debug mode to inspect the prompt sent to the AI model and the API response.
*   **Interactive Confirmation:** Prompts you to confirm the generated commit message before committing.
*   **Supports Forwarded Arguments:**  Allows forwarding arguments to the `git commit` command.

## Prerequisites

*   **git:**  Make sure Git is installed and configured on your system.
*   **jq:** `jq` is required for JSON processing. Install it using your system's package manager (e.g., `apt install jq`, `brew install jq`).
*   **gcloud:** The Google Cloud SDK (`gcloud`) is required for authentication.  Install it and configure it to access your Google Cloud project.  You'll need to authenticate with a Google Cloud account that has access to the Vertex AI API.
*   **Google Cloud Project:**  You need a Google Cloud Project with the Vertex AI API enabled and billing configured.  This project will be used to access the Gemini models.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd gcommit