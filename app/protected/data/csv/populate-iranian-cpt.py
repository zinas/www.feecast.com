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

# For random variables
import random

# Threads
import threading

class myThread (threading.Thread):

    def __init__(self, threadID, physician, center, rate):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.physician = physician
        self.center = center
        self.rate = rate

    def run(self):
        print "T", self.threadID, " loading: ", self.physician, " ", self.center
        insPhysPricStmt = ("INSERT INTO phys_pricing (physician, center, cpt, year, price ) VALUES (%s, %s, %s, %s, %s)")

        try: 
            # Open a second connection
            cnx2 = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
            cursor2 = cnx2.cursor()
        except mysql.connector.Error, e:
            print 'Connection error: ', e

        cntEntries = 0

        # Need to add phys_pricing info
        try:
            for c in range(1,noCPT):
                # Insert only few CPTs per Physician/Center
                r = random.random()
                if (r>0.8):  
                    dataPhysPrice = (self.physician, self.center, c, "2014", self.rate)
                    cursor2.execute(insPhysPricStmt,dataPhysPrice)
                    cntEntries = cntEntries + 1
                    
        except mysql.connector.errors.IntegrityError as e:
            print "IntegrityError: ", cntEntries, " ", e
            pass

        # Make sure commits
        cnx2.commit()
        cnx2.close()


def spawn5Threads(cp,cursor):
    threads = []
    # Create new Threads
    # Start threads
    if ( cp != None ):
        thread1 = myThread(1, cp[0], cp[1], cp[2])
        thread1.start()
        threads.append(thread1)
        cp = cursor.fetchone()

        if (cp != None ):
            thread2 = myThread(2, cp[0], cp[1], cp[2])
            thread2.start()
            threads.append(thread2)
            cp = cursor.fetchone()

            if (cp != None ):
                thread3 = myThread(3, cp[0], cp[1], cp[2])
                thread3.start()
                threads.append(thread3)
                cp = cursor.fetchone()

                if (cp != None ):
                    thread4 = myThread(4, cp[0], cp[1], cp[2])
                    thread4.start()
                    threads.append(thread4)
                    cp = cursor.fetchone()

                    if (cp != None ):
                        thread5 = myThread(5, cp[0], cp[1], cp[2])
                        thread5.start()
                        threads.append(thread5)

    # Wait for threads to complete
    for t in threads:
        t.join()

    print "Finishing batch of 5"



### Connect to MySQL
try:
    cnx = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
    cursor = cnx.cursor()
except MySQLdb.Error, e:
    print 'Connection error: ', e



# Sizes of tables (physicians, centers, cpt)
noPhys = 248

noCenters = 863
startCenter = 800

noCPT = 12480

cnt = 1;
cntEntries = 1;

getCentPhysStmt = ("SELECT physician, center, rateEst FROM center_phys")

cursor.execute(getCentPhysStmt)
cp = cursor.fetchone()

while ( cp != None ):
    print cnt, ": ", cp
    spawn5Threads(cp,cursor)

    # Next
    cnt = cnt + 5
    cp = cursor.fetchone()    


# Make sure commits
cnx.commit()
cnx.close()
