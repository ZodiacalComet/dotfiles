from os import getenv

config = config  # noqa: F821

TERM = getenv("TERMINAL", "st")


def hint_spawn_cmd(cmd: str) -> str:
    return f"hint links spawn --detach {TERM} {cmd} {{hint-url}}"


######################################################################
# => Bidings
######################################################################

# Reload config
config.bind("<Ctrl-r>", "config-source")

# Play video using youtube-viewer
config.bind("<Ctrl-p>", hint_spawn_cmd("youtube-viewer"))

# Show comments on a video using youtube-viewer
config.bind(
    "sc",
    hint_spawn_cmd("youtube-viewer --comments"),
)

# Give a like to a video using youtube-viewer
config.bind(
    "gl",
    hint_spawn_cmd("youtube-viewer --like"),
)

# Open reddit page
config.bind("prc", hint_spawn_cmd("tuir"))
