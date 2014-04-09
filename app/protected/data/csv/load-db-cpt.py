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

# Insert CPT statement
insertCPTStmt = ("INSERT INTO cpt (id, cptCode, cptLongDesc, cptShortDesc, cptAddNotes) VALUES (%s, %s, %s, %s, %s)")

# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter='|')
	try:
            print "ID Code Long Short Note Body"
            for row in csvr:
                # CPT_LONG_DESCRIPTION|CPT_ADD_NOTE|CPT_CODE|CPT_SHORT_DESCRIPTION
                print cnt, '|', row[2], '|', row[0], '|', row[3], '|', row[1]
                dataCPT = (cnt,row[2],row[0],row[3],row[1])
                #cursor.execute(insertCPTStmt,dataCPT)                    
                cnt = cnt + 1
	except csv.Error as e:
            sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))
        except mysql.connector.errors.IntegrityError as e:
            print "IntegrityError: ", row[2]
            pass

print (cnt-1), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
