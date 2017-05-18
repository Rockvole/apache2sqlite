#! /usr/bin/python
import sys
import sqlite3
import apache_log_parser
import pygeoip
from pprint import pprint

def print_usage():
	print("Error: Wrong arguments")
	print("Syntax:")
	print("    apache2sqlite.py <apache_log_file> <output_database>")
	sys.exit()

if len(sys.argv) != 3:
	print_usage()
try:	
	log_name = sys.argv[1]
	db_name  = sys.argv[2]	
except ValueError:
	print_usage()

APACHE_COMBINED="%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\""  
APACHE_COMMON="%h %l %u %t \"%r\" %>s %b"

gi = pygeoip.GeoIP('/usr/share/GeoIP/GeoIP.dat')
line_parser = apache_log_parser.make_parser(APACHE_COMBINED)

conn = sqlite3.connect(db_name)
c = conn.cursor()
try:
	c.execute("DROP TABLE logs")
except sqlite3.OperationalError:
	pass

try:
	c.execute("CREATE TABLE logs (id INTEGER PRIMARY KEY, source, request, status integer, size integer, method, referer, agent, version integer, date, user, label, country)")
except sqlite3.OperationalError:
	print("logs table already exists")

f = open(log_name, 'r')
line_num = 1
for line in f:
	line_data = line_parser(line)
	c.execute("   INSERT into logs "
	          "               (id, source, request, status, size, method, referer, agent, version, date, user, country) "
	          "        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
	          (str(line_num),
	           line_data['remote_host'],
	           line_data['request_url'],
	           line_data['status'],
	           line_data['response_bytes_clf'],
	           line_data['request_method'],
	           line_data['request_header_referer'],
	           line_data['request_header_user_agent'],
	           line_data['request_http_ver'],
	           line_data['time_received'],
	           line_data['remote_user'],
	           gi.country_name_by_addr(line_data['remote_host']))
	          )
	conn.commit()	
		
	#pprint(line_data)
	#if line_num > 0:
	#	break
	line_num = line_num + 1

conn.close()
