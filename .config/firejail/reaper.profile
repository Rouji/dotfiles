include disable-common.inc	# dangerous directories like ~/.ssh and ~/.gnupg
include disable-xdg.inc	# standard user directories: Documents, Pictures, Videos, Music

whitelist ${HOME}/.wine_reaper
whitelist ${HOME}/.cache/mesa_shader_cache
whitelist ${HOME}/.config/pipewire
whitelist ${HOME}/.config/alsa
whitelist ${HOME}/.Xdefaults-winnie
whitelist ${HOME}/.Xdefaults
whitelist ${HOME}/.wine_reaper/dosdevices
include whitelist-common.inc

whitelist ${RUNUSER}/pulse
include whitelist-runuser-common.inc
whitelist /usr/share/drirc
whitelist /usr/share/wine
include whitelist-usr-share-common.inc
whitelist /var/lib/alsa/conf.d
include whitelist-var-common.inc

net none
netfilter
noroot
nou2f
restrict-namespaces
