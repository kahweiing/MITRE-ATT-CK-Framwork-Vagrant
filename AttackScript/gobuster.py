#!/usr/bin/python3

import multiprocessing
import subprocess
import os
import sys

if __name__ == "__main__":

    targetip = sys.argv[1]

    print("\n1.directory-list-2.3-medium.txt\n")
    print("2.directory-list-2.3-small.txt\n")
    choice = int(input("\nSelect wordlist: "))
    if choice == 1:
        wordlist = "/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
    else:
        wordlist = "/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt"

    gobuster_command = "gobuster dir -u http://%s -w=%s -x php" % (targetip, wordlist)
    print("Executing: ", gobuster_command)
    os.system(gobuster_command)
