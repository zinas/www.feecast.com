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
cnt = 194

# Insert Center statement
# id, TIN, centLogin, centPwd, name, addrNum, addrRoad, addrCity, addrCounty, addrState, 
# addrZip, logoLoc, dateCreated, dateUpdated, phone, url, desc, licExpiration
insertCenterStmt = ("INSERT INTO center (id, TIN, centLogin, centPwd, name, addrCity, addrCounty, addrState, phone, centDesc) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")

# Facility,City,County,Facility Type


# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter='|')
	try:
       		for row in csvr:
                    # Facility, [0]
                    # City, [1]
                    # County, [2]
		    # Desc, [3]
                    login = 'FL' + str(cnt)
                    print cnt, '|', cnt, '|', login, '|', login, '|', row[0], '|', row[1], '|', row[2], '|FL|', row[3]
                    dataCenter = (cnt,cnt,login,login,row[0],row[1],row[2],'FL', '0000000000',row[3])
                    cursor.execute(insertCenterStmt,dataCenter)                    
                    cnt = cnt + 1
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-194), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
