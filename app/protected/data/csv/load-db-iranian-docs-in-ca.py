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
cnt = 4

# Insert center_pricing statement
insertPhysStmt = ("INSERT INTO physician (id, phyLic, phyLogin, phyPwd, phyName, phyFamName, phyEmail, phyPhone, phyFax) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")

# NO|Last Name|First Name|Phon|Fax/phon|Email|Speciality |ADDRESS |
# 1|ABBASSI|ALEX|818-348-1000|818-345-7707|info@vwii.com|SURGEON|18370 BURBANK BLVD #511, TARZANA|CA|

noCenters = 800


# Open and read csv file
with open(cname,"r") as datfile:
	csvr = csv.reader(datfile, delimiter='|')
	try:
       		for row in csvr:
                    # LastName, [1]
                    # FirstName, [2]
                    # Phone, [3]
		    # Fax, [4]
		    # Email, [5]

		    # Specialty, [6]

		    name = row[2].upper()
		    famName = row[1].upper()
                    login = 'PHYS' + str(cnt)
                    phone = re.sub("[^0-9]", "", row[3])
                    fax = re.sub("[^0-9]", "", row[4])

                    print cnt, '|', login, '|', login, '|', name, '|', famName, '|', row[5], '|', phone, '|', fax, '|', row[6]
                    dataPhy = (cnt,login,login,login,name,famName,row[5],phone,fax)
                    cursor.execute(insertPhysStmt,dataPhy) 

		    # Find the specialty id
		    getSpec = "SELECT id FROM specialty WHERE specActor LIKE '%s%s%s' OR specName LIKE '%s%s%s'" % ("%", row[6], "%", "%", row[6], "%")

		    print getSpec
		    cursor.execute(getSpec)
		    spec = cursor.fetchone()
		    specList = [];
		    while ( spec != None ):
			    spec = cursor.fetchone()
			    r = random.random()
			    if (r>0.75 and spec != None ):
				    print cnt,  " --> ", spec[0]
				    specList.append(spec[0])
		    print specList
		    
		    insertPhySpecStmt = ("INSERT INTO phys_spec (phyID, specID) VALUES (%s, %s)")
		    for s in specList:
			    dataSpec = (cnt,s)
			    cursor.execute(insertPhySpecStmt,dataSpec)

                    cnt = cnt + 1

	except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

# # Open and read csv file
# with open(cname,"r") as datfile:
# 	csvr = csv.reader(datfile, delimiter='|')
# 	try:
#        		for row in csvr:
#                     try:
#                         id = int(row[0])

#                         if (len(cpt)>0):
#                             # CNT | center({1..10} | 0 | CPT | 2014 | priceIns | pricePatient
#                             print cnt, '| 1 | 0 |', row[0], '(', cpt[0] , ')| 2014 |', pIns, '|', pPat
#                             dataCenterPricing = (1,0,cpt[0],2014,pIns,pPat)
#                             cursor.execute(insertCPStmt,dataCenterPricing)  
#                             cnt = cnt + 1

#                             # Affiliate with some centers
#                             for i in range(1,10):
#                                 r = random.random()
#                                 if (r>0.9):
#                                     pIns = pIns - (r+0.5)*pIns
#                                     pPat = pPat - (r+0.5)*pPat                                    
#                                 print cnt, '|', i, '| 0 |', row[0], '(', cpt[0] , ')| 2014 |', pIns, '|', pPat
#                                 dataCenterPricing = (i,0,cpt[0],2014,pIns,pPat)                            
#                                 cursor.execute(insertCPStmt,dataCenterPricing)
#                                 cnt = cnt + 1
#                     except ValueError as e:
#                         pass
#                     except TypeError as e:
#                         pass
#                     except mysql.connector.errors.IntegrityError as e:
#                         print "IntegrityError: ", cpt[0]
#                         pass
                        
# 	except csv.Error as e:
#         	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

print (cnt-3), ' physicians added'

# Make sure commits
cnx.commit()
cnx.close()
