export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# https://sw.kovidgoyal.net/kitty/glossary/#envvar-VISUAL
export VISUAL=nvim

# -z true ( string lenght 0 ) so startx not started yer
# XDG_VTNR is it the first virutal terminal ?
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
