#!/usr/bin/env python

"""Updates stdiscosrv Dockerfile with the latest TeamCity linux-amd64 build.
Python 2/3 compatible.

"""
import xml.etree.cElementTree as ET
try:
    from urllib2 import urljoin, urlopen
except ImportError:
    from urllib.request import urljoin, urlopen

BASE_URL = "https://build2.syncthing.net"

def get_result(url):
    """Download given url and return ElementTree tree

    """
    res = urlopen(urljoin(BASE_URL, url))
    if not res:
        return ""
    res = res.read().decode()
    tree = ET.fromstring(res)
    return tree

def get_id():
    """Get latest build id from TeamCity

    Returns: 'id' - integer

    """
    id_url = ("/guestAuth/app/rest/buildTypes/"
              "id:DiscoveryServer_Build/builds?locator=branch:master,"
              "state:finished,status:SUCCESS,count:1")
    tree = get_result(id_url)
    id = tree.find('build').attrib['id']
    return id

def get_release():
    """Return url for latest linux-amd64 build

    """
    id = get_id()
    if not id:
        return ""
    build_url = ("/guestAuth/app/rest/builds/"
                 "id:{}/artifacts/children".format(id))
    tree = get_result(build_url)
    url = next((i.attrib['href'] for i in tree if
                i.attrib['name'].startswith('stdiscosrv-linux-amd64')), None)
    url = url.replace('metadata', 'content')
    return url


def update_stdiscosrv():
    """Update stdicosrv Dockerfile with latest release download link

    """
    url = get_release()
    if not url:
        return
    url = urljoin(BASE_URL, url)
    with open('Dockerfile') as f:
        file = f.readlines()
        for idx, line in enumerate(file):
            if line.startswith('ADD'):
                file[idx] = "ADD {} /stdiscosrv.tar.gz\n".format(url)
    with open('Dockerfile', 'w') as f:
        f.writelines(file)


if __name__ == "__main__":
    update_stdiscosrv()
