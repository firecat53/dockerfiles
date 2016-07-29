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
    """Get stdiscosrv latest linux-amd64 release version from the Jenkins API.

    Returns: download url

    """
    jenkins_url = ("https://build.syncthing.net/job/"
                   "stdiscosrv/lastStableBuild/api/json")
    res = urlopen(jenkins_url)
    if not res:
        return ""
    res = res.read().decode()
    res = json.loads(res)
    fn = [i['fileName'] for i in res['artifacts']
          if 'linux-amd64' in i['fileName']][0]
    return "{}artifact/{}".format(res['url'], fn)


def update_stdiscosrv():
    """Update stdicosrv Dockerfile with latest release download link

    """
    url = get_release()
    if not url:
        return
    with open('Dockerfile') as f:
        file = f.readlines()
        for idx, line in enumerate(file):
            if line.startswith('ADD'):
                file[idx] = "ADD {} /stdiscosrv.tar.gz\n".format(url)
    with open('Dockerfile', 'w') as f:
        f.writelines(file)


if __name__ == "__main__":
    update_stdiscosrv()
