#!/bin/python
import MySQLdb
db = MySQLdb.connect(host='127.0.0.1',user='root',passwd='123456')
cur = db.cursor()
cur.execute('show slave status')
#print(cur)
for row in cur.fetchall():
 #print(row)
 #print(row[10])
 #print(row[11])
 if row[10]=='Yes' and row[11]=='Yes':
    print('slave is ok') 
db.close
#dir(pymysql)
