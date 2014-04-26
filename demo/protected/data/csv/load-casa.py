#!/usr/bin/python
# Inserts the values of a csv file

# For getting the script name and handling files
import sys

# For csv parsing
import csv

# For connecting to mysql
import mysql.connector

# To keep only the phone number
import re

# For reading the date
from time import strptime, strftime
import time


try:
	cname = sys.argv[1];
	print 'Reading: ' , cname
except IndexError as e:
	print 'Usage: ', sys.argv[0], " <csvfile>" 
	print 'Need csv file as argument: %s' % (e)	
	sys.exit(0)


### Connect to MySQL
try:
	cnx = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
	cursor = cnx.cursor()
except MySQLdb.Error, e:
	print 'Connection error: ', e


# Counting the number of entries 
noCenters = 800
cnt = 801

# Insert Center statement
# id, TIN, centLogin, centPwd, name, addrNum, addrRoad, addrCity, addrCounty, addrState, 
# addrZip, logoLoc, dateCreated, dateUpdated, centPhone, centFax, url, desc, licExpiration
insertCenterStmt = ("INSERT INTO center (id, TIN, centLogin, centPwd, name, addrCity, addrCounty, addrState, addrZip, centPhone, centFax) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")


# Open and read csv file
with open(cname,"r") as datfile:
    while True:
        try:
            line1 = datfile.readline()
            line2 = datfile.readline()
            line3 = datfile.readline()
            if not line1 or not line2 or not line3: break
            print line1, "|", line2, "|", line3

            login = 'CA' + str(cnt)        
            name = line1[0:len(line1)-1]
            first = line2.find(",")
            addr = line2[0:first]

            last = line2.rfind(",")
            phone = line2[last+1:len(line2)-1]
            phone = re.sub("[^0-9]", "", phone)
        
            first = line3.find(",")
            city = line3[0:first]
            second = line3.find(",",first+1)
            third = line3.find(",",second+1)
            #print first, second, third
            zipC = line3[second+1:third]
            zipC = zipC[0:5]

            last = line3.rfind(":")
            fax = "0000000000"
            if (last != -1):
                fax = line3[last+1:len(line3)-1]
                fax = re.sub("[^0-9]", "", fax)
                
            print cnt,'|', cnt, '|', login, '|', login, '|', name, "|", addr, "|", phone, "|", fax, '|', city, "|CA|", zipC

            dataCenter = (cnt,cnt,login,login,name,city,"","CA",zipC,phone,fax)
            cursor.execute(insertCenterStmt,dataCenter) 

            cnt = cnt + 1

        except mysql.connector.errors.IntegrityError as e:
            print "IntegrityError: ", e
            pass


print (cnt-801), ' centers added'

# Make sure commits
cnx.commit()
cnx.close()
