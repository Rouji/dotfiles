# FireJail profile for OpenCode
# Place this file in ~/.config/firejail/opencode.profile

include /etc/firejail/disable-common.inc
#include /etc/firejail/disable-programs.inc
#include /etc/firejail/disable-devel.inc
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
whitelist ~/.opencode
whitelist ~/.local/share/opencode
whitelist ~/.cache
whitelist ~/.config
whitelist ~/.npm

