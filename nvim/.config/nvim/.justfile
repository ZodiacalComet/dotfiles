OPTS := "--quote-style AutoPreferDouble --indent-type spaces --indent-width 2"

default: lint

lint:
	stylua {{OPTS}} --glob {*,*/**}.lua !lua/plugins.lua !plugin/** -- .
	stylua {{OPTS}} --call-parentheses NoSingleTable lua/plugins.lua
