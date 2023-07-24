# AstroNVIM user config

## Debuggers

### Python

```bash
# Install debugger in virtualenv.
pip install debugpy
# Start program with debugger.
python  -m debugpy --listen 5678 lwe/main.py
```

Set a breakpoint and start the debugger in Neovim, select 'Attach remote'
