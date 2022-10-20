#!/usr/bin/python3

import multiprocessing
import subprocess
import os


def pinger(job_q, results_q):
    DEVNULL = open(os.devnull, 'w')
    while True:
        ip = job_q.get()
        if ip is None: break

        try:
            subprocess.check_call(['ping', '-c1', ip],
                                  stdout=DEVNULL)
            results_q.put(ip)
        except:
            pass


if __name__ == "__main__":
    pool_size = 255

    jobs = multiprocessing.Queue()
    results = multiprocessing.Queue()

    pool = [multiprocessing.Process(target=pinger, args=(jobs, results))
            for i in range(pool_size)]

    for p in pool:
        p.start()

    for i in range(1, 255):
        jobs.put('172.24.2.{0}'.format(i))
        # jobs.put('%s'+'{0}'.format(i)) %ip

    for p in pool:
        jobs.put(None)

    for p in pool:
        p.join()

    while not results.empty():
        ip = results.get()
        print("Host found: ", ip)
        nmap_command = "nmap -p- --min-rate=5000 -A -sC -sV %s -Pn" % (ip)
        print("\nExecuting: ", nmap_command, "\n")
        os.system(nmap_command)
        print("\n")
