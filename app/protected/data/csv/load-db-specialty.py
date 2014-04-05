#!/usr/bin/python
# Inserts the values of a csv file

# For getting the script name and handling files
import sys

# For csv parsing
import csv

# For connecting to mysql
import mysql.connector

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

# Insert specialty statement
insertSpecStmt = ("INSERT INTO specialty (id, category, specName, specActor, specPlural, specNote) VALUES (%s, %s, %s, %s, %s, %s)")

# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter=',')
	try:
    		print "ID Category Name Actor Plural Desc"
       		for row in csvr:
                    # uid,index,category,name,actor,actors,description
                    cat = 0
                    if row[2] != 'medical':
                        cat = 1
                    print cnt, '|', row[2], '|', row[3], '|', row[4], '|', row[5], '|', row[6]
                    dataSpec = (cnt,cat,row[3],row[4],row[5],row[6])
                    cursor.execute(insertSpecStmt,dataSpec)
                    
                    cnt = cnt + 1
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-1), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
