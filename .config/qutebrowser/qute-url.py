config = config  # noqa: F821

SEARCH_ENGINES = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "fimfic": "https://www.fimfiction.net/stories?q={}",
    "derpi": "https://www.derpibooru.org/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "gh": "https://github.com/search?q={}",
    "deb-pkg": "https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords={}",
}

config.set("url.default_page", "https://start.duckduckgo.com/")
config.set("url.searchengines", SEARCH_ENGINES)
