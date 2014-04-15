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


### Connect to MySQL
try:
	cnx = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
	cursor = cnx.cursor()

        # Open a second connection
	cnx2 = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
	cursor2 = cnx2.cursor()
except MySQLdb.Error, e:
	print 'Connection error: ', e


# Sizes of tables (physicians, centers, cpt)
noPhys = 248

noCenters = 863
startCenter = 800

noCPT = 12565

cnt = 1;

# Iterate over all NorCal centers
for c in range(startCenter,noCenters):

    # Insert center_pricing statement
    insCentPhysStmt = ("INSERT INTO center_phys (id, physician, center, rateEst) VALUES (%s, %s, %s, %s)")

    try:
        # Iterate over all physicians
        nphys = 0;
        for p in range(1,noPhys):

            # Insert connect 
            r = random.random()

            # associate the 10% of physicians
            if (r>0.9):
                v = random.random() * 1000
                dataCentPhys = (cnt, p, c, v) 
                print cnt, " -> ", p, " ", v
                cursor.execute(insCentPhysStmt,dataCentPhys)
                nphys = nphys + 1
                cnt = cnt + 1
        
        print c, " has ", nphys

    except mysql.connector.errors.IntegrityError as e:
        print "IntegrityError: ", e
        pass


print noPhys, ' physician details added'

# Make sure commits
cnx.commit()
cnx.close()

cnx2.commit()
cnx2.close()
