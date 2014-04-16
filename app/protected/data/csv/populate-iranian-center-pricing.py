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

    def __init__(self, threadID, centerID):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.centerID = centerID

    def run(self):
        print "T", self.threadID, " loading: ", self.centerID

        insPhysPricStmt = ("INSERT INTO center_pricing (center, insurance, cpt, year, priceIns, pricePatient ) VALUES (%s, %s, %s, %s, %s, %s)")

        try: 
            # Open two connections
            cnx = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
            cursor = cnx.cursor()

            cnx2 = mysql.connector.connect(user='ip',password='diogenis',database='feecastdb')
            cursor2 = cnx2.cursor()
        except mysql.connector.Error, e:
            print 'Connection error: ', e

        cntEntries = 0
        
        startIns = 1
        endIns = 14

        # Read the medicare data
        with open("medicare-published.csv","r") as datfile:
            csvr = csv.reader(datfile, delimiter=',')
            try:
       		for row in csvr:
                    try:
                        pIns = float(row[3])
                        pPat = float(row[4])

                        # Find the CPT code
                        getCPT = "SELECT id FROM cpt WHERE cptCode LIKE '%s'" % row[0]
                        cursor.execute(getCPT)
                        cpt = cursor.fetchone()

                        if (len(cpt)>0):
                            #print self.centerID, '|0|', cpt[0], '|2014|', pIns, '|', pPat
                            dataCenterPricing = (self.centerID,0,cpt[0],2014,pIns,pPat)
                            cursor2.execute(insPhysPricStmt,dataCenterPricing)  

                            # Also, add values for the other insurances
                            for ins in range(startIns,endIns):
                                r = random.random() + 0.5
                                pInsPart = pIns * r
                                pPatPart = pPat * r
    
                                #print self.centerID, ins, cpt[0], '|2014|', pInsPart, '|', pPatPart
                                dataCenterPricing = (self.centerID,ins,cpt[0],2014,pInsPart,pPatPart)
                                cursor2.execute(insPhysPricStmt,dataCenterPricing)

                    except ValueError as e:
                        pass
                    except TypeError as e:
                        pass
                    except mysql.connector.errors.IntegrityError as e:
                        print "IntegrityError: ", self.centerID, " ", ins, " ", cpt[0]
                        pass
                        
            except csv.Error as e:
        	sys.exit('file %s, line %d: %s' % (rname, resultReader.line_num, e))

        # Make sure commits
        cnx.commit()
        cnx.close()
        cnx2.commit()
        cnx2.close()


def spawn5Threads(startCenter):
    threads = []
    # Create new Threads
    # Start threads
    thread1 = myThread(1, startCenter+0)
    thread2 = myThread(2, startCenter+1)
    thread3 = myThread(3, startCenter+2)
    thread4 = myThread(4, startCenter+3)
    thread5 = myThread(5, startCenter+4)

    thread1.start()
    thread2.start()
    thread3.start()
    thread4.start()
    thread5.start()
    
    threads.append(thread1)
    threads.append(thread2)
    threads.append(thread3)
    threads.append(thread4)
    threads.append(thread5)

    # Wait for threads to complete
    for t in threads:
        t.join()

    print "Finishing batch of 5"


# Sizes of tables (physicians, centers, cpt)
startCenter = 834
endCenter = 844

cnt = 1;

for i in range(startCenter,endCenter,5):
    print cnt, ": ", i
    spawn5Threads(i)
    # Next
    cnt = cnt + 5

