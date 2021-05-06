import weechat
weechat.register('blah', 'a', '0.1', 'MIT', 'Replace annoying people with "blah"', '', '')

nicks = []

if not weechat.config_is_set_plugin('nicks'):
    weechat.config_set_plugin('nicks','')

def config_changed():
    global nicks
    nicks = weechat.config_get_plugin('nicks').split(',')

def blah_word(word):
    l = len(word)
    return ('blah' * (l//4 + 1))[:l]

def blah_string(string):
    return ' '.join([blah_word(w) for w in string.split(' ')])

def privmsg(data, modifier, modifier_data, string):
    parsed = weechat.info_get_hashtable("irc_message_parse", {'message': string})
    msg_nick = parsed['nick']
    if msg_nick not in nicks:
        return string
    parsed['text'] = blah_string(parsed['text'])

    return ':{host} {command} {channel} {text}'.format(**parsed)

weechat.hook_modifier('irc_in2_privmsg', 'privmsg', '')
weechat.hook_config('plugins.var.python.blah.*', 'config_changed', '')
config_changed()
