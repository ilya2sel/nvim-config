#!/usr/bin/env python3

import os
import subprocess
import shutil

HOME_DIR = os.path.expanduser("~")
BASHRC_PATH = os.path.join(HOME_DIR, ".bashrc")
BASH_ALIASES_PATH = os.path.join(HOME_DIR, ".bash_aliases")

NVIM_TARBALL = "nvim-linux64.tar.gz"
NVIM_PKG_URL = "https://github.com/neovim/neovim/releases/download/v0.10.3/" + NVIM_TARBALL
PACKER_PATH = os.path.join(
    HOME_DIR, ".local", "share", "nvim", "site", "pack", "packer", "start", "packer.nvim"
)

def run_cmd(command, check=True):
    """
    Run a shell command.
    If check=True, it raises an exception on non-zero return code.
    """
    print(f"Running command: {command}")
    subprocess.run(command, shell=True, check=check)

def file_contains_line(file_path, line):
    """
    Returns True if a given file contains the specified line.
    """
    if not os.path.exists(file_path):
        return False
    with open(file_path, "r") as f:
        for existing_line in f:
            if existing_line.strip() == line.strip():
                return True
    return False

def append_line_once(file_path, line):
    """
    Appends a line to file_path only if it doesn't already exist.
    """
    if not file_contains_line(file_path, line):
        with open(file_path, "a") as f:
            f.write(line + "\n")
        print(f"Appended line to {file_path}: {line.strip()}")
    else:
        print(f"Line already exists in {file_path}: {line.strip()} -- skipping.")

def ensure_packer_installed():
    """
    Ensure nvim-packer is installed in ~/.local/share/nvim/site/pack/packer/start/packer.nvim.
    If it exists (and might conflict), remove it first and then clone.
    """
    if os.path.exists(PACKER_PATH):
        print(f"Removing existing packer directory at {PACKER_PATH} ...")
        shutil.rmtree(PACKER_PATH)
    run_cmd("git clone --depth 1 https://github.com/wbthomason/packer.nvim " + PACKER_PATH)

def ensure_composer_installed():
    """
    If /usr/local/bin/composer doesn't exist, install Composer globally.
    """
    if os.path.exists("/usr/local/bin/composer"):
        print("Composer already exists at /usr/local/bin/composer -- skipping install.")
        return

    # Commands as specified
    run_cmd('php -r "copy(\'https://getcomposer.org/installer\', \'composer-setup.php\');"')
    run_cmd(
        'php -r "if (hash_file(\'sha384\', \'composer-setup.php\') '
        '=== \'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6\') '
        '{ echo \'Installer verified\'.PHP_EOL; } '
        'else { echo \'Installer corrupt\'.PHP_EOL; unlink(\'composer-setup.php\'); exit(1); }"'
    )
    run_cmd("php composer-setup.php")
    run_cmd('php -r "unlink(\'composer-setup.php\');"')

    run_cmd("sudo mv composer.phar /usr/local/bin/composer")
    print("Composer installed successfully.")

def main():
    # 1) Download Neovim tarball. If present, remove it first to avoid stale files:
    if os.path.exists(NVIM_TARBALL):
        os.remove(NVIM_TARBALL)
    run_cmd(f"curl -LO {NVIM_PKG_URL}")

    # 2) Remove old /opt/nvim (as per instructions) and re-extract Neovim
    run_cmd("sudo rm -rf /opt/nvim")
    run_cmd(f"sudo tar -C /opt -xzf {NVIM_TARBALL}")

    # 3) Add Neovim to PATH in ~/.bashrc (appended if not already present)
    append_line_once(BASHRC_PATH, 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"')

    # 4) Ensure packer.nvim is installed
    ensure_packer_installed()

    # 5) Add custom 'cd' behavior to ~/.bashrc if not present
    custom_cd_function = r'''
# Custom cd behavior
cd() {
    case "$1" in
        "")
            builtin cd ~
            ;;
        local)
            builtin cd /workspaces/obi-dev-env/
            ;;
        sc)
            builtin cd /workspaces/obi-dev-env/apps/frontend/shipping-center/
            ;;
        rdm)
            builtin cd /workspaces/obi-dev-env/apps/frontend/rdm/
            ;;
        tracking-app)
            builtin cd /workspaces/obi-dev-env/apps/frontend/tracking-app/
            ;;
        reviews-app)
            builtin cd /workspaces/obi-dev-env/apps/frontend/customer-reviews-form/
            ;;
        warehouses-app)
            builtin cd /workspaces/obi-dev-env/apps/mobile/Xpedigo-Warehouses/
            ;;
        drivers-app)
            builtin cd /workspaces/obi-dev-env/apps/mobile/xpedigo-drivers/
            ;;
        accounts)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-accounts/
            ;;
        dispatch)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-dispatch-routing/
            ;;
        pod)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-pod/
            ;;
        tracking)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-shipment-tracking/
            ;;
        warehouse)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-warehouse/
            ;;
        ore)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-ore/
            ;;
        xre)
            builtin cd /workspaces/obi-dev-env/apps/services/service-xre/
            ;;
        matrix)
            builtin cd /workspaces/obi-dev-env/apps/services/service-matrix/
            ;;
        communications)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-communications/
            ;;
        orders)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-orders/
            ;;
        area-resolver)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-shipment-area-resolver/
            ;;
        shipments)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-shipments/
            ;;
        territory)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-territory-management/
            ;;
        vehicles)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-vehicles/
            ;;
        websockets)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-websockets/
            ;;
        auth)
            builtin cd /workspaces/obi-dev-env/apps/lambda/api-gateway-auth/
            ;;
        layers)
            builtin cd /workspaces/obi-dev-env/apps/lambda/layers/
            ;;
        exports)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-exports/
            ;;
        migrations)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-lambda-migrations/
            ;;
        redis-trimmer)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-redis-trimmer/
            ;;
        reviews)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-reviews/
            ;;
        *)
            builtin cd "$1"     # Default to normal behavior for other paths
            ;;
    esac
}
'''.strip("\n")

    if not file_contains_line(BASHRC_PATH, "cd() {"):
        with open(BASHRC_PATH, "a") as f:
            f.write("\n" + custom_cd_function + "\n")
        print("Appended custom cd function to ~/.bashrc")
    else:
        print("Custom cd function already found in ~/.bashrc -- skipping.")

    # 6) Create or update ~/.bash_aliases with specific aliases
    aliases_content = r'''
alias vim="nvim"
alias activate="source ./venv/bin/activate"
alias start="explorer.exe"
'''.strip("\n")

    # We overwrite ~/.bash_aliases if not found, or ensure lines are present:
    if not os.path.exists(BASH_ALIASES_PATH):
        with open(BASH_ALIASES_PATH, "w") as f:
            f.write(aliases_content + "\n")
        print(f"Created {BASH_ALIASES_PATH} with default aliases.")
    else:
        # Append line by line if not present
        for line in aliases_content.splitlines():
            append_line_once(BASH_ALIASES_PATH, line)

    # 7) Update and install software-properties-common (won't fail if already installed)
    run_cmd("sudo apt-get update")
    run_cmd("sudo apt-get install -y software-properties-common")

    # 8) Add PHP 8.2 repository if not already added & install
    # For simplicity, we'll just run it again; it won't break if already present:
    run_cmd("sudo add-apt-repository -y ppa:ondrej/php")
    run_cmd("sudo apt-get update")
    run_cmd("sudo apt-get install -y php8.2 php8.2-cli php8.2-bz2 php8.2-curl php8.2-mbstring php8.2-intl php8.2-xml")

    # 9) Ensure composer is installed
    ensure_composer_installed()

    # 10) Install ripgrep (again, no error if already installed)
    run_cmd("sudo apt-get install -y ripgrep")

    print("\nAll tasks completed successfully.")
    print("Open a new terminal or run 'source ~/.bashrc' for changes to take effect.")

if __name__ == "__main__":
    main()
