# Install and Run Toaster

## Prepare Python
Run all commands on poky top directory.

Prepare environment:

```sh
python3 -m venv .venv
source .venv/bin/activate
```

Install Requirements:

```sh
pip3 install -r bitbake/toaster-requirements.txt
```

## Start Toaster

Run command on poky top directory.
```sh
source oe-init-build-env
```

Run command from build directory:
```sh
source toaster start
```
Open:
http://127.0.0.1:8000

