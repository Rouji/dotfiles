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
whitelist ~/.cache
whitelist ~/.config/opencode
read-write ~/.config/opencode
whitelist ~/.kube
read-only ~/.kube
whitelist ~/.npm
read-write ~/.npm
