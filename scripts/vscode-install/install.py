import os
from pathlib import Path
from shutil import copyfile

home_dir = os.environ.get("HOME", "~")
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


def install():
    print("Installing bash configuration in VS Code")

    files_to_be_copied = [
        root_dir.joinpath(".bashrc"),
        root_dir.joinpath(".hyper.js"),
        root_dir.joinpath(".vimrc"),
        root_dir.joinpath(".zshrc")
    ]

    for src_file in files_to_be_copied:
        dest_file = home_dir.joinpath(src_file.name)
        copy_file(src_file, dest_file)

    print("Installation complete!")


if __name__ == "__main__":
    install()
