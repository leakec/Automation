import json
import requests

MY_EMAIL = "example@example.com"
MY_PASS = "dummpyPass"

def get_ngrok_url():
    url = "http://localhost:4040/api/tunnels/"
    res = requests.get(url)
    res_unicode = res.content.decode("utf-8")
    res_json = json.loads(res_unicode)
    for i in res_json["tunnels"]:
        if i['name'] == 'command_line':
            return i['public_url']
            break

import smtplib
#SERVER = "localhost"

FROM = MY_EMAIL 

TO = [MY_EMAIL] # must be a list

SUBJECT = "Cook Book URL"

TEXT = "Cook book URL:\n" + get_ngrok_url()

# Prepare actual message
message = """\
From: %s
To: %s
Subject: %s

%s
""" % (FROM, ", ".join(TO), SUBJECT, TEXT)

print(message)

# Send the email
#server = smtplib.SMTP('smtp.gmail.com', 587)
#server.starttls()
#server.login(MY_EMAIL,MY_PASS)
#server.sendmail(FROM, TO, message)
#server.quit()
