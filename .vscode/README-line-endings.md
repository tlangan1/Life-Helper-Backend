- A command to find all the distinct extension for all the files in a directory and all the subdirectories. It skips files without extensions.

```bash
find . -type f -name '*.*' ! -name '.*' | awk -F. '{ext=tolower($NF); sub(/\r$/, "", ext); print ext}' | sort -u
```

This one skips the folders 'node_modules' and '.git'

```bash
find . \( -type d \( -name node_modules -o -name .git \) -prune \) -o \( -type f -name '*.*' ! -name '.*' -print \) \
| awk -F. '{ext=tolower($NF); sub(/\r$/, "", ext); print ext}' \
| sort -u
```

If I understand the syntax than this one skips the folders 'node_modules' and '.git' and 'root CA certificates'

```bash
find . \( -type d \( -name node_modules -o -name .git -o -name 'root CA certificates' \) -prune \) -o \( -type f -name '*.*' ! -name '.*' -print \) \
| awk -F. '{ext=tolower($NF); sub(/\r$/, "", ext); print ext}' \
| sort -u
```

Copilot recommended the following command to convert text files from CRLF to LF while skipping the three folders, .git, node_modules and 'root CA certificates'.

```bash
find . ( -type d ( -name .git -o -name node_modules -o -name 'root CA certificates' ) -prune ) -o -type f -print0 | xargs -0r grep -IlZ $'\r' | xargs -0r perl -i -pe 's/\r$//'
```
