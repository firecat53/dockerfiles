#!/usr/bin/env python

"""Updates Dockerfile and Dockerfile.supervisord with the latest Github Release
Syncthing version. Python 2/3 compatible.

"""
import json
import re
try:
    from urllib2 import urlopen
except ImportError:
    from urllib.request import urlopen


def get_release():
    """Get syncthing release version from the Github API.

    Returns: version - empty or string like 'v0.9.15'

    """
    github_url = ("https://api.github.com/repos/syncthing/"
                  "syncthing/releases?per_page=1")
    res = urlopen(github_url)
    if not res:
        return ""
    res = res.read().decode()
    res = json.loads(res)
    if res[0]['prerelease'] is False:
        return res[0]['name'] or res[0]['tag_name']
    else:
        print("Prerelease found. No changes made")
        return ""


def update_files():
    """Update Dockerfile and Dockerfile.supervisord with the newest version

    """
    files = ["Dockerfile", "Dockerfile.supervisord"]
    v = get_release()
    if not v:
        return
    for fn in files:
        with open(fn) as f:
            file = f.readlines()
            for idx, line in enumerate(file):
                file[idx] = re.sub('v\d+\.\d+\.\d+', v, line)
        with open(fn, 'w') as f:
            f.writelines(file)


if __name__ == "__main__":
    update_files()
