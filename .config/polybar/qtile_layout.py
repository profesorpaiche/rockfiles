#!/usr/bin/env python3

from libqtile.command.client import InteractiveCommandClient

c = InteractiveCommandClient()
print(c.group.info()['layout'])
