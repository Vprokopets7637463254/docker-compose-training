import time
import redis
from flask import Flask
import pymysql
import psycopg2
import random

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)
            
@app.route('/')
def web():
    #redis
    
    count = get_hit_count()
    
    #sql
    
    connection = pymysql.connect(
    user='user',
    password='test',
    database='myDb',
    cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        try:
            create_table_query = "CREATE TABLE `Person`(id int AUTO_INCREMENT," \
                                " name varchar(32)," \
                                " password varchar(32), PRIMARY KEY (id));"
            cursor.execute(create_table_query)
        except:
            pass
    with connection.cursor() as cursor:
        insert_query = "INSERT INTO `Person` (name, password) VALUE ('aaa', 'aaa');"
        cursor.execute(insert_query)
        connection.commit()
        
    with connection.cursor() as cursor:
        select_all_rows = "SELECT * FROM `Person`"
        cursor.execute(select_all_rows)
        rows = cursor.fetchall()
        result = ''
        for row in rows:
            result += str(row) + '<br>'
   
    #Postgre
    
    con = psycopg2.connect(
    database = 'myDb',
    user = "admin",
    password = "admin") 
    con.autocommit = True
    with con.cursor() as cursor:
        try:    
            create_table_query = """CREATE TABLE military_enlistment_list (
                                    id serial PRIMARY KEY,
                                    name varchar(32) NOT NULL,
                                    password varchar(32) NOT NULL);"""
            cursor.execute(create_table_query)
        except:
            pass
    with con.cursor() as cursor:
        cursor.execute(
            """INSERT INTO military_enlistment_list (name, password) VALUES
            ('aaa', 'aaa');"""
        )
    with con.cursor() as cursor:
        select_all_rows = "SELECT * FROM military_enlistment_list"
        cursor.execute(select_all_rows)
        rows = cursor.fetchall()
        result1 = ''
        for row in rows:
            result1 += str(row) + '<br>'  
    
    
    outcome = '\nHi, Boris Djonson! I see you {}  !.\n\n'.format(count)
    return outcome
