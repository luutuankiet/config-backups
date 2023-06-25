import subprocess
from collections import namedtuple
from albert import Action, Item, TriggerQuery, TriggerQueryHandler, runTerminal

md_iid = '1.0'
md_version = '1.4'
md_name = 'Window Switcher'
md_description = 'windows switcher'
md_url = 'https://github.com/talengu/albert-python/tree/master/window_switcher'
md_maintainers = '@talengu'


Window = namedtuple("Window", ["wid", "desktop",
                    "wm_class", "host", "wm_name"])


def parseWindow(line):
    win_id, desktop, rest = line.decode().split(None, 2)
    win_class, rest = rest.split('  ', 1)
    host, title = rest.strip().split(None, 1)
    return [win_id, desktop, win_class, host, title]


class Plugin(TriggerQueryHandler):

    def id(self) -> str:
        return __name__

    def name(self) -> str:
        return md_name

    def description(self) -> str:
        return md_description

    def initialize(self) -> None:
        return

    def finalize(self) -> None:
        return

    def defaultTrigger(self) -> str:
        return "w "

    def synopsis(self) -> str:
        return 'query'

    def handleTriggerQuery(self, query) -> None:
        stripped = query.string.strip().lower()

        if stripped:
            results = []
        lines = subprocess.check_output(['wmctrl', '-l', '-x']).splitlines()

        for lid, line in enumerate(lines):
            # print(stripped,line)

            win = Window(*parseWindow(line))
            print(lid, win)
            if win.desktop == "-1":
                continue
            try:
                win_instance, win_class = win.wm_class.replace(
                    ' ', '-').split('.')
            except:
                try:
                    win_instance, win_class = win.wm_class.replace(
                        '.Org', '@Org').split('@')
                except:
                    continue
            matches = [
                win_instance.lower(),
                win_class.lower(),
                win.wm_name.lower(),
            ]
            # print(win_instance, win_class)
            if any(stripped in match for match in matches):
                item = Item(
                    id="%s%s" % (md_name, win.wm_class),
                    subtext=win.wm_name,
                    icon=["xdg:%s" % win_instance.lower()],
                    #  text="%s" % (win_class.replace('-', ' ').lower()),
                    text=win.wm_name,

                    actions=[
                        Action("Switch Window", "", lambda c=win.wid: runTerminal(
                            "wmctrl -i -a %s" % c, close_on_exit=True)),
                        Action("Move window to this desktop", "", lambda c=win.wid: runTerminal(
                            "wmctrl -i -R %s" % c, close_on_exit=True)),
                        Action("Close the window gracefully.", "", lambda c=win.wid: runTerminal(
                            "wmctrl -c %s" % c, close_on_exit=True)),
                    ]
                )
                query.add(item)
