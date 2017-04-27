#! /usr/bin/python
import sys
import sqlite3

def print_usage():
	print("Error: Wrong arguments")
	print("Syntax:")
	print("    sqlite2apache.py <sqlite_database> <table_name> <apache_log_file>")
	sys.exit()

if len(sys.argv) != 4:
	print_usage()
try:	
	db_name  = sys.argv[1]	
	table_name = sys.argv[2]
	log_name = sys.argv[3]
except ValueError:
	print_usage()

C_ID = 0
C_SOURCE = 1
C_REQUEST = 2
C_STATUS = 3
C_SIZE = 4
C_METHOD = 5
C_REFERER = 6
C_AGENT = 7
C_VERSION = 8
C_DATE = 9
C_USER = 10

conn = sqlite3.connect(db_name)
c = conn.cursor()

try:
	c.execute("SELECT * FROM "+table_name+" ORDER BY id")
except sqlite3.OperationalError:
	print(table_name+" table does not exist")

f = open(log_name, 'w')
while True:
    batch = c.fetchmany(100)
    if not batch:
        break
    for record in batch:
		#print record[C_ID]
		f.write(str(record[C_SOURCE]) +" "+
		        str(record[C_USER])+" "+
		        "- "+
		        str(record[C_DATE]) +" "+
		        "\""+
		        str(record[C_METHOD]) +" "+
		        str(record[C_REQUEST]) +" "+
		        "HTTP/"+str(record[C_VERSION]) +"\" "+
		        
		        str(record[C_STATUS]) +" "+
		        str(record[C_SIZE]) +" "+
		        "\""+
		        str(record[C_REFERER]) +"\" "+
		        "\""+
		        str(record[C_AGENT]) +"\""+
		        "\n")
