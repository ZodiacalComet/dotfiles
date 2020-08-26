from pathlib import Path

config = config  # noqa: F821

# Reload config
config.bind("<Ctrl-r>", "config-source")

# Spawn mpv on selected url with hint
play_url_script = str(Path.home() / ".scripts" / "play-url")
config.bind("<Ctrl-p>", "hint links spawn --detach " + play_url_script + " {hint-url}")
