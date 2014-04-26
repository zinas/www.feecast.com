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
cnt = 1

# Insert Center statement
# id, TIN, centLogin, centPwd, name, addrNum, addrRoad, addrCity, addrCounty, addrState, 
# addrZip, logoLoc, dateCreated, dateUpdated, phone, url, desc, licExpiration
insertCenterStmt = ("INSERT INTO center (id, TIN, centLogin, centPwd, name, addrRoad, addrCity, addrCounty, addrState, addrZip, phone, licExpiration) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")

# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter=',')
	try:
    		print "ID TIN City Zip County State Phone Expiration"
       		for row in csvr:
                    # Ambulatory Surgical Treatment Center, - [0]
                    # Address, [1]
                    # City, [2]
                    # Zip, [3]
                    # County, [4]
                    # Phone, [5]
                    # License #, [6]
                    # License Expiration Date [7]
                    print cnt, '|', row[6], '|', row[2], '|', row[3], '|', row[4], '|IL|', row[5], '|', row[7]
                    login = 'IL' + str(cnt)
                    phone = re.sub("[^0-9]", "", row[5])
                    expire = time.strptime(row[7], "%m/%d/%y")
                    dataCenter = (cnt,row[6],login,login,row[0],row[1],row[2],row[4],'IL',row[3],phone,strftime('%Y-%m-%d %H:%M:%S',expire))
                    cursor.execute(insertCenterStmt,dataCenter)                    
                    cnt = cnt + 1
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-1), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
