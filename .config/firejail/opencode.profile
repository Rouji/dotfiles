# FireJail profile for OpenCode
noblacklist ~/.kube
include /etc/firejail/disable-common.inc
#include /etc/firejail/disable-interpreters.inc

caps.drop all
netfilter
nodvd
nogroups
noinput
nonewprivs
nosound
notv
novideo
seccomp

# Allow necessary directories
whitelist ~/.local/share/opencode
whitelist ~/.local/state/opencode
whitelist ~/.local/lib/opencode2
read-only ~/.local/lib/opencode2
whitelist ~/.weave
read-write ~/.weave
whitelist ~/.cache
whitelist ~/.config/opencode
read-write ~/.config/opencode
whitelist ~/.kube
read-only ~/.kube
whitelist ~/.npm
read-write ~/.npm

# Rust toolchain (cargo, rustup, rustc, rustdoc)
whitelist ~/.cargo
read-write ~/.cargo
whitelist ~/.rustup
read-write ~/.rustup

# Serena MCP (LSP-backed code tools), installed via `uv tool install serena-agent`
whitelist ~/.local/share/uv/tools/serena-agent
read-only ~/.local/share/uv/tools/serena-agent
whitelist ~/.local/share/uv/python
read-only ~/.local/share/uv/python
whitelist ~/.serena
read-write ~/.serena
