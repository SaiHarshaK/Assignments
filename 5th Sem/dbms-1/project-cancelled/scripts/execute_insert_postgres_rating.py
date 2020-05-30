import psycopg2

#Establishing the connection
conn = psycopg2.connect(
   database="postgres", user='postgres', password='postgres', host='127.0.0.1', port= '5432'
)
#Setting auto commit false
conn.autocommit = True

#Creating a cursor object using the cursor() method
cursor = conn.cursor()

# stmt = "INSERT INTO Media(category,media_ID,original_title,original_release_date,original_run_time,original_end_date,budget,box_office_gross,running_status,isAdult,original_region,language_name) VALUES ('short','tt0000008','Edison Kinetoscopic Record of a Sneeze',1894,1,NULL,NULL,NULL,NULL,'0','NULL','NULL');"

title = open("../sql-files/rating_nodupes.sql", "r")
i = 0
while True:
    i += 1
    print(i)
    line = title.readline()
    if not line:
        break
    stmt = line[:-1]
    # Preparing SQL queries to INSERT a record into the database.
    try:
        cursor.execute(stmt)
    except psycopg2.IntegrityError:
        conn.rollback()
    else:
        conn.commit()

# Commit your changes in the database
# conn.commit()
print("Records inserted........")

# Closing the connection
conn.close()
