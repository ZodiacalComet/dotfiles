import subprocess

config = config  # noqa: F821


################################################################################
# => Xresources
################################################################################

# Function taken from:
# https://www.qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix) -> dict:
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props


# Getting rid of the "*." at the start of the keys
xresources = dict(
    map(lambda items: (items[0][2:], items[1]), read_xresources("*").items())
)

################################################################################
# => Completion
################################################################################

config.set("colors.completion.even.bg", xresources["background-alt"])
config.set("colors.completion.fg", xresources["color7"])
config.set("colors.completion.match.fg", xresources["color1"])
config.set("colors.completion.odd.bg", xresources["background-alt"])

#
# -> Category
#

config.set("colors.completion.category.bg", xresources["background"])
config.set("colors.completion.category.border.bottom", xresources["color7"])
config.set("colors.completion.category.border.top", xresources["color7"])
config.set("colors.completion.category.fg", xresources["color7"])

#
# -> Item
#

config.set("colors.completion.item.selected.bg", xresources["color4"])
config.set("colors.completion.item.selected.border.bottom", xresources["color12"])
config.set("colors.completion.item.selected.border.top", xresources["color12"])
config.set("colors.completion.item.selected.fg", xresources["background"])

#
# -> Scrollbar
#

# Color of the scrollbar in the completion view.
# Type: QssColor
# config.set("colors.completion.scrollbar.bg", xresources["color3"])

# Color of the scrollbar handle in the completion view.
# Type: QssColor
# config.set("colors.completion.scrollbar.fg", xresources["color5"])

################################################################################
# => Downloads
################################################################################

config.set("colors.downloads.bar.bg", xresources["background"])

config.set("colors.downloads.error.bg", xresources["color1"])
config.set("colors.downloads.error.fg", xresources["background"])

config.set("colors.downloads.start.bg", xresources["color4"])
config.set("colors.downloads.start.fg", xresources["background"])

config.set("colors.downloads.stop.bg", xresources["color2"])
config.set("colors.downloads.stop.fg", xresources["background"])

config.set("colors.downloads.system.bg", "rgb")
config.set("colors.downloads.system.fg", "rgb")

################################################################################
# => Hints
################################################################################

config.set("colors.hints.bg", xresources["color3"])
config.set("colors.hints.fg", xresources["background"])
config.set("colors.hints.match.fg", xresources["color2"])

################################################################################
# => Keyhint
################################################################################

# Background color of the keyhint widget.
# Type: QssColor
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

# Text color for the keyhint widget.
# Type: QssColor
# c.colors.keyhint.fg = '#FFFFFF'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
# c.colors.keyhint.suffix.fg = '#FFFF00'

################################################################################
# => Messages
################################################################################

config.set("colors.messages.error.bg", xresources["color1"])
config.set("colors.messages.error.border", xresources["color9"])
config.set("colors.messages.error.fg", xresources["background"])

config.set("colors.messages.info.bg", xresources["background-alt"])
config.set("colors.messages.info.border", xresources["background-alt"])
config.set("colors.messages.info.fg", xresources["color7"])

config.set("colors.messages.warning.bg", xresources["color3"])
config.set("colors.messages.warning.border", xresources["color11"])
config.set("colors.messages.warning.fg", xresources["background"])

################################################################################
# => Prompts
################################################################################

# Background color for prompts.
# Type: QssColor
# c.colors.prompts.bg = '#444444'

# Border used around UI elements in prompts.
# Type: String
# c.colors.prompts.border = '1px solid gray'

# Foreground color for prompts.
# Type: QssColor
# c.colors.prompts.fg = 'white'

# Background color for the selected item in filename prompts.
# Type: QssColor
# c.colors.prompts.selected.bg = 'grey'

################################################################################
# => Statusbar
################################################################################

config.set("colors.statusbar.normal.bg", xresources["background"])
config.set("colors.statusbar.normal.fg", xresources["color7"])

# Background color of the statusbar in passthrough mode.
# Type: QssColor
# c.colors.statusbar.passthrough.bg = 'darkblue'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
# c.colors.statusbar.passthrough.fg = 'white'

config.set("colors.statusbar.private.bg", xresources["background-alt"])
config.set("colors.statusbar.private.fg", xresources["color15"])

config.set("colors.statusbar.progress.bg", xresources["color7"])

#
# -> Caret Mode
#

config.set("colors.statusbar.caret.bg", xresources["color5"])
config.set("colors.statusbar.caret.fg", xresources["background"])
config.set("colors.statusbar.caret.selection.bg", xresources["color5"])
config.set("colors.statusbar.caret.selection.fg", xresources["background"])

#
# -> Command Mode
#

config.set("colors.statusbar.command.bg", xresources["background"])
config.set("colors.statusbar.command.fg", xresources["color7"])

config.set("colors.statusbar.command.private.bg", xresources["background-alt"])
config.set("colors.statusbar.command.private.fg", xresources["color15"])

#
# -> Insert Mode
#

config.set("colors.statusbar.insert.bg", xresources["color10"])
config.set("colors.statusbar.insert.fg", xresources["background"])

#
# -> URL
#

config.set("colors.statusbar.url.error.fg", xresources["color1"])
config.set("colors.statusbar.url.fg", xresources["color7"])
config.set("colors.statusbar.url.hover.fg", xresources["color4"])
config.set("colors.statusbar.url.success.http.fg", xresources["color2"])
config.set("colors.statusbar.url.success.https.fg", xresources["color2"])
config.set("colors.statusbar.url.warn.fg", xresources["color3"])

################################################################################
# => Tabs
################################################################################

config.set("colors.tabs.bar.bg", xresources["background"])
config.set("colors.tabs.even.bg", xresources["background-alt"])
config.set("colors.tabs.even.fg", xresources["color15"])
config.set("colors.tabs.odd.bg", xresources["background"])
config.set("colors.tabs.odd.fg", xresources["color7"])

#
# -> Indicator
#

config.set("colors.tabs.indicator.error", xresources["color1"])
config.set("colors.tabs.indicator.start", xresources["color4"])
config.set("colors.tabs.indicator.stop", xresources["color2"])
config.set("colors.tabs.indicator.system", "rgb")

#
# -> Selected
#

config.set("colors.tabs.selected.even.bg", xresources["color4"])
config.set("colors.tabs.selected.even.fg", xresources["background"])
config.set("colors.tabs.selected.odd.bg", xresources["color4"])
config.set("colors.tabs.selected.odd.fg", xresources["background"])

################################################################################
# => Webpage
################################################################################

config.set("colors.webpage.bg", "white")
