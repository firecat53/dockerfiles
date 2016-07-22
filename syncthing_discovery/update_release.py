#!/usr/bin/env python

"""Updates stdiscosrv Dockerfile with the latest Jenkins linux-amd64 build.
Python 2/3 compatible.

"""
import json
try:
    from urllib2 import urlopen
except ImportError:
    from urllib.request import urlopen


def get_release():
    """Get syncthing latest release version from the Github API.

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


def get_sha():
    """Get most recent 'master' branch syncthing SHA from the Github API.

    Returns: 7 digit SHA string

    """
    github_url = ("https://api.github.com/repos/syncthing/"
                  "syncthing/commits?per_page=1&sha=master")
    res = urlopen(github_url)
    if not res:
        return ""
    res = res.read().decode()
    res = json.loads(res)
    return res[0]['sha'][:7]


def update_stdiscosrv():
    """Update stdicosrv Dockerfile with latest release download link

    """
    v = get_release()
    sha = get_sha()
    v = get_release()
    if not v:
        return
    url = "https://build.syncthing.net/job/stdiscosrv/lastStableBuild/artifact/stdiscosrv-linux-amd64-{}+1-g{}.tar.gz"
    with open('Dockerfile') as f:
        file = f.readlines()
        for idx, line in enumerate(file):
            if line.startswith('ADD'):
                file[idx] = "ADD {} /stdiscosrv.tar.gz\n".format(
                    url.format(v, sha))
    with open('Dockerfile', 'w') as f:
        f.writelines(file)


if __name__ == "__main__":
    update_stdiscosrv()
