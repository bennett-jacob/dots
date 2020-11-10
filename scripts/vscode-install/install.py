import os
from pathlib import Path
from shutil import copyfile
import subprocess
from typing import Callable

home_dir = Path(os.environ.get("HOME", "/root"))
cwd = Path(__file__).parent.absolute()
root_dir = cwd.parent.parent.absolute()


def copy_file(src_path: Path, dest_path: Path):
    """Copy file from src_path to dest_path, making a backup of dest_path if necessary."""
    print(f"Moving file '{src_path}' -> '{dest_path}'")

    if dest_path.is_file():
        print(f" > {dest_path} already exists... Making a backup.")
        backup_path = f"{dest_path}.backup"
        copyfile(dest_path, backup_path)
        print(f" > Successfully backed up file at {backup_path}")

    copyfile(src_path, dest_path)


def install_config_files():
    files_to_be_copied = [
        root_dir.joinpath(".bashrc"),
        root_dir.joinpath(".hyper.js"),
        root_dir.joinpath(".vimrc"),
        root_dir.joinpath(".zshrc")
    ]

    for src_file in files_to_be_copied:
        dest_file = home_dir.joinpath(src_file.name)
        copy_file(src_file, dest_file)


def install_oh_my_bash():
    subprocess.run([
        "bash",
        '-c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"',
    ])


def do(func: Callable):
    """Run func and print some formatting around it."""
    print("--------------------------------------------------")
    print(f"Running {func.__name__}")
    print()
    func()
    print()


def install():
    print("Installing bash configuration in VS Code")
    do(install_config_files)
    do(install_oh_my_bash)
    print("Installation complete!")


if __name__ == "__main__":
    install()
