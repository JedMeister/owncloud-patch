#!/usr/bin/python
"""Set ownCloud admin username & password

Option:
    --pass= unless provided, will ask interactively
    --user= unless provided, will ask interactively
             DEFAULT=admin
"""

from sys import stderr, argv, exit
from getopt import gnu_getopt, GetoptError
from shutil import copy2, move
from hashlib import md5
from random import choice
from string import letters, digits

from dialog_wrapper import Dialog
from mysqlconf import MySQL

def usage(s=None):
    if s:
        print >> stderr, "Error:", s
    print >> stderr, "Syntax: %s [options]" % argv[0]
    print >> stderr, __doc__
    exit(1)

DEFAULT_USER="admin"

def main():
    try:
        opts, args = gnu_getopt(argv[1:], "h",
                                       ['help', 'pass=', 'user='])
    except GetoptError, e:
        usage(e)

    username = ""
    password = ""
    for opt, val in opts:
        if opt in ('-h', '--help'):
            usage()
        elif opt == '--pass':
            password = val
        elif opt == '--user ':
            username = val

    if not username:
        if 'd' not in locals():
            d = Dialog('TurnKey Linux - First boot configuration')
        username = d.get_input(
            "ownCloud Admin Username",
            "Enter the username for the ownCloud Admin user).",
            DEFAULT_USER)
    if username == "DEFAULT":
        username = DEFAULT_USER

    if not password:
        d = Dialog('TurnKey Linux - First boot configuration')
        password = d.get_password(
            "ownCloud Password",
            "Enter new password for the ownCloud Admin account")

    hashpass = md5(password).hexdigest()

    m = MySQL()
    m.execute('UPDATE owncloud.oc_users SET uid=\"%s\" WHERE id=\"1\";' % username)
    m.execute('UPDATE owncloud.oc_users SET password=\"%s\"  WHERE id=\"1\";' % hashpass)
    m.execute('UPDATE owncloud.oc_group_user SET uid=\"%s\" WHERE id=\"1\";' % username)

if __name__ == "__main__":
    main()
