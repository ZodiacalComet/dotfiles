from os import getenv
from pathlib import Path

config = config  # noqa: F821

######################################################################
# => Bidings
######################################################################

# Reload config
config.bind("<Ctrl-r>", "config-source")

# Spawn mpv on selected url with hint
play_url_script = str(Path.home() / ".scripts" / "bin" / "play-url")
config.bind("<Ctrl-p>", "hint links spawn --detach " + play_url_script + " {hint-url}")

# Spawn show-yt-info script on TERMINAL
TERM = getenv("TERMINAL", "st")
show_yt_info_script = str(Path.home() / ".scripts" / "show-yt-info")
config.bind(
    "<Ctrl-i>",
    f"hint links spawn --detach {TERM} {show_yt_info_script}" + " {hint-url}",
)
