#!/usr/bin/python
# Inserts the values of a csv file

# For getting the script name and handling files
import sys

# For csv parsing
import csv

# For connecting to mysql
import mysql.connector

cname = sys.argv[1];
print 'Reading: ' , cname

### Connect to MySQL
try:
	cnx = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
	cursor = cnx.cursor()
except MySQLdb.Error, e:
	print 'Connection error: ', e

# Counting the number of entries 
cnt = 1

# Open and read csv file
with open(cname,"r") as datfile:
	insertProvider2Stmt = ("INSERT INTO ins_provider (id, insName, insLogo) VALUES (%s, %s, %s)")
	insertProvider3Stmt = ("INSERT INTO ins_provider (id, insName, insNote, insLogo) VALUES (%s, %s, %s, %s)")
	csvr = csv.reader(datfile, delimiter=',')
	try:
    		print "ID UID Name Note"
       		for row in csvr:
       			if len(row) == 2:
       				print cnt, '|', row[0], '|', row[1]
       				# Insert Provider
       				dataProvider2 = (cnt,row[1],row[0])
       				cursor.execute(insertProvider2Stmt,dataProvider2)
       			else:
        			print cnt, '|', row[0], '|', row[1], '|', row[2]
   	    			# Insert Provider
       				dataProvider3 = (cnt,row[1],row[2],row[0])
       				cursor.execute(insertProvider3Stmt,dataProvider3)
        		cnt = cnt + 1
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-1), ' providers added'
# Make sure commits
cnx.commit()
cnx.close()
