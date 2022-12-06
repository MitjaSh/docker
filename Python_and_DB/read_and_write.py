import psycopg2
import time
from datetime import datetime


with open('results.txt', 'a') as sf:
    sf.write(datetime.now().strftime('%Y-%m-%d %H:%M:%S')
             + ' Starts\n')

time.sleep(10)

con = psycopg2.connect(
  database="postgres", 
  user="admin", 
  password="root", 
  #host="127.0.0.1",
  host="db_srv",
  port="5432"
)

print("Database opened successfully")

cur = con.cursor()  
##cur.execute('''CREATE TABLE STUDENT  
##     (ADMISSION INT PRIMARY KEY NOT NULL,
##     NAME TEXT NOT NULL,
##     AGE INT NOT NULL,
##     COURSE CHAR(50),
##     DEPARTMENT CHAR(50));''')

##print("Table created successfully")

##cur.execute(
##  "INSERT INTO STUDENT (ADMISSION,NAME,AGE,COURSE,DEPARTMENT) VALUES (3421, 'Fedor', 22, 'Programmer', 'ICT')"
##)
##
##print("Record inserted successfully")

cur.execute("SELECT admission, name, age, course, department from STUDENT")
  
rows = cur.fetchall()
for row in rows:  
   print("ADMISSION =", row[0])
   print("NAME =", row[1])
   print("AGE =", row[2])
   print("COURSE =", row[3])
   print("DEPARTMENT =", row[4], "\n")

   with open('results.txt', 'a') as sf:
      sf.write(row[1]+'\n')

print("Operation done successfully")  

con.commit()  
con.close()
