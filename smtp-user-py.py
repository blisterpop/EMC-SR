#!/usr/bin/env python
#File: smtp-user-py.py

# Created by Jim Lemanowicz
# 08/16/2018

import smtplib
import os

def prompt(prompt):
    return raw_input(prompt).strip()

fromaddr = 'ny-isilon@med.cornell.edu'
toaddrs  = ['jal2850@med.cornell.edu' ,'omorales@med.cornell.edu' ,' maf2083@med.cornell.edu'] 
filename = 'total-UserID.txt'

# cd
os.chdir('/ifs/isi1/jal2850_vol1/EMC-SR')

# read file into fcontent variable
with file(filename) as f:
    fcontent = f.read()

# Add the From: and To: headers at the start!
msg = ("From: ny-isilon@med.cornell.edu\r\nTo: jal2850@med.cornell.edu,omorales@med.cornell.edu,maf2083@med.cornell.edu\r\nSubject: Isilon NY User, Session & Heat Report\r\n\r\n")

line = fcontent
msg = msg + line

print "Message length is " + repr(len(msg))

server = smtplib.SMTP('smtp.med.cornell.edu')
server.set_debuglevel(1)
server.sendmail(fromaddr, toaddrs, msg)
server.quit()

