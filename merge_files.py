#!/usr/bin/env python3
import argparse
import pathlib
import fnmatch

def load_ignore_patterns(ignore_file_path: pathlib.Path) -> list[str]:
    """
    Load ignore patterns from a .findignore file.
    If the file does not exist, return default patterns.

    Patterns starting with a slash are normalized (leading slash removed)
    to match the relative path format.
    """
    if ignore_file_path.exists():
        patterns = []
        for line in ignore_file_path.read_text(encoding='utf-8').splitlines():
            line = line.strip()
            # Skip empty lines and comments.
            if not line or line.startswith("#"):
                continue
            # Normalize pattern: remove leading slash if present.
            if line.startswith("/"):
                line = line[1:]
            patterns.append(line)
        return patterns
    else:
        # Default ignore patterns if .findignore is not present.
        return ['__init__.py', '.devcontainer/*', '.github/*']

def should_include(file_path: pathlib.Path, ignore_patterns: list[str], start_dir: pathlib.Path) -> bool:
    """
    Determine whether a file should be included by comparing its relative path
    and its filename to each ignore pattern.
    """
    try:
        rel_path = file_path.relative_to(start_dir).as_posix()
    except ValueError:
        rel_path = file_path.as_posix()

    for pattern in ignore_patterns:
        # If the pattern does not include a '/', match only the filename.
        if "/" not in pattern:
            if fnmatch.fnmatch(file_path.name, pattern):
                return False
        else:
            if fnmatch.fnmatch(rel_path, pattern):
                return False
    return True

def main():
    parser = argparse.ArgumentParser(
        description="Combine files into a single output with formatting, respecting .findignore."
    )
    parser.add_argument(
        "pattern",
        nargs="?",
        default="*.py",
        help="File pattern to search for (default: '*.py')"
    )
    args = parser.parse_args()
    search_pattern = args.pattern

    start_dir = pathlib.Path('.')
    ignore_file = start_dir / '.findignore'
    ignore_patterns = load_ignore_patterns(ignore_file)

    # Find all files matching the search pattern recursively.
    all_files = list(start_dir.rglob(search_pattern))
    filtered_files = [
        f for f in all_files if should_include(f, ignore_patterns, start_dir)
    ]
    filtered_files.sort()

    output_file = start_dir / 'combined.txt'
    with output_file.open('w', encoding='utf-8') as out_f:
        for file_path in filtered_files:
            # Write header with the file's relative path.
            out_f.write(f"=== {file_path.relative_to(start_dir).as_posix()} ===\n")
            # Use a language marker if it's a Python file; otherwise generic.
            out_f.write("~~~\n")
            try:
                content = file_path.read_text(encoding='utf-8')
            except Exception as e:
                content = f"# Error reading file: {e}"
            out_f.write(content)
            out_f.write("\n~~~\n\n")  # End code block and add an empty line

if __name__ == '__main__':
    main()
