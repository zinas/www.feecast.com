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

# Insert plan statement
insertPlanStmt = ("INSERT INTO ins_plan (id, insurance, planName, planDesc, planLogo) VALUES (%s, %s, %s, %s, %s)")

# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter=',')
	try:
    		print "ID UID Provider Name Note"
       		for row in csvr:
       			if len(row) == 4:
       				print cnt, '|', row[0], '|', row[1], '|', row[2], '|', row[3]

				# Get the id of a provider with the specified logo
				getProviderStmt = "SELECT id FROM ins_provider AS p WHERE p.insLogo LIKE '%s'" % row[1]
				#print 'Querying provider: ', getProviderStmt
				cursor.execute(getProviderStmt)
				ins = cursor.fetchone()
       				dataPlan = (cnt,ins[0],row[2],row[3],row[0])
				print cnt,ins[0],row[2],row[3],row[0]
       				cursor.execute(insertPlanStmt,dataPlan)

        		cnt = cnt + 1
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-1), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
