# 🔒 Make All Public GitHub Repositories Private (Lazy Bash Script)

A quick-and-dirty Bash script to mass-change all your **public** repositories to **private** using the [GitHub CLI](https://cli.github.com).

Perfect for when you’ve outgrown your old code, want a fresh start, or simply don’t want strangers poking around your half-baked experiments.

## ⚠️ What This Script Does

- Lists all public repositories under your GitHub account.

- Prompts for confirmation before proceeding.

- Converts each listed repo to **private**, one by one.

## ⚠️ Irreversible Consequences

Read this **before running** the script:

- ⭐ **Stars and watchers will be permanently lost**.

- 🍴 **Public forks will be detached** and remain as public repositories under the forker’s account.

- 🌐 **GitHub Pages sites will be unpublished** if they were hosted from affected repositories.

- 🗃️ **GitHub Archive Program participation ends** for those repos.

- 🛡️ Some features (e.g., Code Scanning) may stop working or require additional configuration.

This script is **not reversible**. Proceed with caution.

## 🛠️ Setup Instructions

1. **Install GitHub CLI**

    Follow installation steps at: <https://cli.github.com>

2. **Authenticate your account**
    Run:

    ```bash
    gh auth login 
    ```

3. **Download the script**

    - Option 1: Clone the repo

    ```bash
    git clone https://github.com/fcortesbio/make-all-repo-private
    cd make-all-repo-private    
    ```

4. **Edit the script with your GitHub username**
    Open the file in your editor:

    ```bash
    nvim all-private.sh
    ```

    Then change:

    ```bash
    USERNAME="your-username"
    ```

    Replace `"your-username"` with your actual GitHub username.

5. **Make the script executable**

    ```bash
    chmod +x all-private.sh
    ```

6. **Run the script**

    ```bash
    ./all-private.sh
    ```

☕ You might want to have some coffee ready — especially if you have a long list of repos.
