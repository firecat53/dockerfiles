#!/usr/bin/env python

"""Updates Dockerfile with the latest Github Release Syncthing version. Python
2/3 compatible.

"""
import json
import re
try:
    from urllib2 import urlopen
except ImportError:
    from urllib.request import urlopen


def get_release():
    """Get syncthing latest release version from the Github API.

    Returns: version - empty or string like 'v0.9.15'

    """
    github_url = ("https://api.github.com/repos/syncthing/"
                  "syncthing/releases")
    res = urlopen(github_url)
    if not res:
        return ""
    res = res.read().decode()
    res = json.loads(res)
    for idx, _ in enumerate(res):
        if res[idx]['prerelease'] is False:
            return res[idx]['name'] or res[idx]['tag_name']
    print("No regular release found. No changes made")
    return ""


def update_syncthing():
    """Update Dockerfile with the newest version number

    """
    ver = get_release()
    if not ver:
        return
    with open('Dockerfile') as f:
        file = f.readlines()
        for idx, line in enumerate(file):
            file[idx] = re.sub(r'v\d+\.\d+\.\d+', ver, line)
    with open('Dockerfile', 'w') as f:
        f.writelines(file)


if __name__ == "__main__":
    update_syncthing()
