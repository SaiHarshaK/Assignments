my_insert = "INSERT INTO Media(category,media_ID,original_title,original_release_date,original_run_time,original_end_date,budget,box_office_gross,running_status,isAdult,original_region,language_name) VALUES ('short','tt0000001','Carmencita',1894,1,NULL,NULL,NULL,NULL,'0','NULL','NULL');"

# my_insert = """insert into some_table (col1, col2, col3) values (100,
            #                            '() string with parantheses ()', 2.3);"""

import sqlite3
conn = sqlite3.connect(":memory:")
conn.execute("create table media (category,media_ID,original_title,original_release_date,original_run_time,original_end_date,budget,box_office_gross,running_status,isAdult,original_region,language_name)")
conn.execute(my_insert)
parsed_rows = list(conn.execute("select * from media"))
conn.close()

print(parsed_rows)
# Output:
#[(100, '() string with parantheses ()', 2.3)]


