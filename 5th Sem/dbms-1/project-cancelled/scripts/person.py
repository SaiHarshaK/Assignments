import re
def splitter(raw):
    row = []
    word = ""
    i = 0
    while( i < len(raw)):
        #print(raw[i])
        if raw[i] == ";":
            if raw[i:i+6] == "; or, ":
                word += raw[i:i+6]
                #print("shiiip", word)
                i += 6
            else:
                word += raw[i]
                i += 1
        elif raw[i] == "\\":
            row.append("\\N")
            i += 2
        elif raw[i] == "\t" or raw[i] == "\n":
            row.append(word)
            word = ""
            i += 1
        else:
            word += raw[i]
            i += 1
    row.append(word)
    
    return [x for x in row if x]

tableName = "person"
#header = ["category", "ID", "original_title", "original_release_date", "original_run_time", "original_end_date", "budget", "box_office_gross", "running_status", "isAdult", "original_region", "name", "rating_ID"]
header = ["person_ID", "person_name", "birth_year", "death_year", "gender"]
isStr  = [1, 1, 0, 0, 1]


# generate sql query
sql_row = "INSERT INTO " + tableName + "("
for index in header:
  sql_row += index + ","

sql_row = sql_row[:-1]
sql_row += ") VALUES ("

#body = []

# do for seperate datasets
f = open("person_full.sql", "w+")
title = open("imdb/name.basics.tsv", "r")

#order_fill = [2, 1, -1, 3, 10, 4, 6, 5, -1] # index 1. -1 -> ignore
#tconst	titleType	primaryTitle	originalTitle	isAdult	startYear	endYear	runtimeMinutes	genres

order_fill = [1,2,3,4,-1,-1] # index 1. -1 -> ignore
#nconst	primaryName	birthYear	deathYear	primaryProfession	knownForTitles

isHeader = True
#for raw_row in title:
while True:
  line = title.readline()
  if not line:
      break
  print("wait?: " + line)
  file_row = splitter(line)
  body_row = [None] * len(header)
  if isHeader is True:
    print(file_row) 
    isHeader = False
    continue
  
  for i in range(len(order_fill)):
    index_header = order_fill[i]
    if index_header is -1:
      continue
    if file_row[i] != '\\N':
      body_row[index_header - 1] = file_row[i]
    else:
      body_row[index_header - 1] = "NULL"

  #body.append(body_row)

  gen_sql_row = sql_row
  #if value is of str only then have to add ''
  print(body_row)
  # pre process body_row to convert None to NULL
  for j in range(len(body_row)):
      if body_row[j] == None:
          body_row[j] = "NULL"
      if isStr[j] == 1:
          body_row[j] = re.sub(r'\'','\'\'',body_row[j])
          gen_sql_row += "'" + body_row[j] + "',"
      else:
          gen_sql_row += body_row[j] + ","

  gen_sql_row = gen_sql_row[:-1]
  gen_sql_row += ");\n"
  f.write(gen_sql_row)


# we have all the final data now, to generate final part of sql_row. TODOS
  #+  "VALUES ('nm0000001','Fred Astaire',1899,'1987','soundtrack,actor,miscellaneous','tt0072308,tt0053137,tt0043044,tt0050419');"
  #now process every row
#f = open("media.sql", "w+")
#for i in range(len(body)):

f.close()
title.close()

