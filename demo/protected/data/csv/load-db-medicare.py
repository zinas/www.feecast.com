#!/usr/bin/python
# Inserts the values of a csv file

# For getting the script name and handling files
import sys

# For csv parsing
import csv

# For connecting to mysql
import mysql.connector

import random

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

# Insert center_pricing statement
insertCPStmt = ("INSERT INTO center_pricing (center, insurance, cpt, year, priceIns, pricePatient) VALUES (%s, %s, %s, %s, %s, %s)")

# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter=',')
	try:
    		print "ID Insurance CPT Year Price"
       		for row in csvr:
                    try:
                        pIns = float(row[3])
                        pPat = float(row[4])

                        # Find the CPT code
                        getCPT = "SELECT id FROM cpt WHERE cptCode LIKE '%s'" % row[0]
                        cursor.execute(getCPT)
                        cpt = cursor.fetchone()

                        if (len(cpt)>0):
                            # CNT | center({1..10} | 0 | CPT | 2014 | priceIns | pricePatient
                            print cnt, '| 1 | 0 |', row[0], '(', cpt[0] , ')| 2014 |', pIns, '|', pPat
                            dataCenterPricing = (1,0,cpt[0],2014,pIns,pPat)
                            cursor.execute(insertCPStmt,dataCenterPricing)  
                            cnt = cnt + 1

                            # Also, add values for 10 more centers
                            for i in range(2,10):
                                r = random.random()
                                if (r>0.5):
                                    pIns = pIns + pIns*r
                                    pPat = pPat + pPat*r
                                else:
                                    pIns = pIns - (r+0.5)*pIns
                                    pPat = pPat - (r+0.5)*pPat                                    
                                print cnt, '|', i, '| 0 |', row[0], '(', cpt[0] , ')| 2014 |', pIns, '|', pPat
                                dataCenterPricing = (i,0,cpt[0],2014,pIns,pPat)                            
                                cursor.execute(insertCPStmt,dataCenterPricing)
                                cnt = cnt + 1
                    except ValueError as e:
                        pass
                    except TypeError as e:
                        pass
                    except mysql.connector.errors.IntegrityError as e:
                        print "IntegrityError: ", cpt[0]
                        pass
                        
	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-1), ' plans added'

# Make sure commits
cnx.commit()
cnx.close()
