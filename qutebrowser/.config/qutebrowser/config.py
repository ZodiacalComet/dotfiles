from os import getenv

config = config  # noqa: F821

################################################################################
# => Constants
################################################################################

TERM = [getenv("TERMINAL", "st")]
EDITOR = [getenv("EDITOR", "vim")]
FONT = '"JetBrains Mono NL"'

################################################################################
# => Default
################################################################################

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

config.set("content.javascript.enabled", True, "file://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

################################################################################
# => Backend
################################################################################

config.set("backend", "webengine")

################################################################################
# => Source
################################################################################

config.source("qute-colors.py")
config.source("qute-binds.py")
config.source("qute-url.py")

################################################################################
# => Completion
################################################################################

config.set("completion.cmd_history_max_items", 100)
config.set("completion.delay", 0)
config.set("completion.height", "32%")
config.set("completion.min_chars", 1)

# Which categories to show (in which order) in the :open completion.
# Type: FlagList
# Valid values:
#   - searchengines
#   - quickmarks
#   - bookmarks
#   - history
# c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history']

config.set("completion.web_history.max_items", 50)

################################################################################
# => Content
################################################################################

# https://wiki.archlinux.org/index.php/Qutebrowser#Minimize_fingerprinting
config.set("content.headers.accept_language", "en-US,en;q=0.5")
config.set(
    "content.headers.custom",
    {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"},
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0",
)
config.set("content.canvas_reading", False)
config.set("content.webgl", False)

################################################################################
# => Editor
################################################################################

config.set("editor.command", [*TERM, *EDITOR, "{file}"])
config.set("editor.encoding", "utf-8")

################################################################################
# => Fonts
################################################################################

config.set(
    "fonts.monospace",
    FONT
    + ', "xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal',
)

################################################################################
# => Hints
################################################################################

# The 'k' key is a pain to type in this keyboard.
config.set("hints.chars", "asdfghjl")

################################################################################
# => Messages
################################################################################

config.set("messages.timeout", 5000)

################################################################################
# => Zoom
################################################################################

config.set("zoom.default", "70%")
config.set(
    "zoom.levels",
    [
        "20%",
        "30%",
        "50%",
        "60%",
        "70%",
        "90%",
        "100%",
        "110%",
        "125%",
        "150%",
        "175%",
        "200%",
        "250%",
        "300%",
        "400%",
        "500%",
    ],
)
