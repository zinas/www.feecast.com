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
cnt = 145

# Insert Center statement
# id, TIN, centLogin, centPwd, name, addrNum, addrRoad, addrCity, addrCounty, addrState, 
# addrZip, logoLoc, dateCreated, dateUpdated, phone, url, desc, licExpiration
insertCenterStmt = ("INSERT INTO center (id, TIN, centLogin, centPwd, name, addrRoad, addrCity, addrState, addrZip, phone) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")

# Natividad Medical Center,1330 Natividad Rd,Salinas, CA, 93906,(408)755-4111

# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter=',')
	try:
    		print "ID TIN City Zip County State Phone Expiration"
       		for row in csvr:
                    # Ambulatory Surgical Treatment Center, - [0]
                    # Address, [1]
                    # City, [2]
                    # Zip, [4]
                    # State, [3]
                    # Phone, [5]
                    login = 'MRICA' + str(cnt)
                    phone = re.sub("[^0-9]", "", row[5]) 
                    print cnt, '|', cnt, '|', login, '|', login, '|', row[0], '|', row[1], '|', row[2], '|CA|', row[4], '|', phone
                    #expire = time.strptime(row[7], "%m/%d/%y")
                    dataCenter = (cnt,cnt,login,login,row[0],row[1],row[2],'CA',row[4],phone)
                    cursor.execute(insertCenterStmt,dataCenter)                    
                    cnt = cnt + 1
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-145), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
