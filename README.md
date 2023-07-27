# AstroNVIM user config

## Debuggers

### Python

**NOTE:**  You can't debug files in a different virtualenv without restarting Neovim first.

```bash
# Install debugger in virtualenv.
pip install debugpy
```

#### Local file

Set a breakpoint and start the debugger in Neovim, select 'Python: Launch file'

#### Running program

```bash
# Start program with debugger.
python  -m debugpy --listen 5678 lwe/main.py
# Start program with debugger, wait for the client (for debugging bootstrap).
python  -m debugpy --listen 5678 --wait-for-client lwe/main.py
```

Set a breakpoint and start the debugger in Neovim, select 'Attach remote', hit enter to accept default Host and Port.

### PHP

```bash
# Start up server running remote Xdebug.
al-vagrant.sh standalone
# Kill firewall.
service nftables restart && service nftables stop && nftless
```

Set a breakpoint and start the debugger in Neovim, load the page in the browser.
