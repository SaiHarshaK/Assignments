import itertools

def splitter(raw, dt_header_size):
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
            i += 3
        elif raw[i] == "\t" or raw[i] == "\n":
            row.append(word)
            word = ""
            i += 1
        else:
            word += raw[i]
            i += 1
    row.append(word)

    #return [x for x in row if x]
    print(" split: ", row)
    return row[0:dt_header_size]

tableName = "Media"
header = ["category", "media_ID", "original_title", "original_release_date", "original_run_time", "original_end_date", "budget", "box_office_gross", "running_status", "isAdult", "original_region", "language_name"]
isStr  = [1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1]
#isMulti = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # for multivalued. if in dataset it is seperated by ','
#toIgnore = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # 0 -> dont ignore, 1 is ignore (wrt to the header). useful when some fields are auto generated.

# for update - example
# UPDATE mytable SET nconst = 'nm0000001',primaryName = 'Fred Astaire',birthYear = 1899,deathYear = '1987',primaryProfession = 'soundtrack,actor,miscellaneous',knownForTitles = 'tt0072308,tt0053137,tt0043044,tt0050419' WHERE nconst= 'nm0000001';
# generate sql query
sql_row = "UPDATE " + tableName + " SET "

# do for seperate datasets
f = open("media_update_akas.sql", "w+")
title = open("imdb/title.akas.tsv", "r")

#these vars acc to title
order_fill = [-1, -1, -1, 11, 12, -1, -1, -1] # index 1. -1 -> ignore
where_cond = [(2, 1)] # EXAMPLE - (media_ID(in header), titleId(in title file)) that is, it is a mapping from table and dataset
#this var acc to header
set_which = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1] # 1 is set, 0 is ignore. basically update which fields?
# where_str_append = " ,isOriginalTitle = 1 " # if no where_cond, remove comma in string

isHeader = True
#for raw_row in title:
while True:
  line = title.readline()
  if not line:
      break
  print("wait?: " + line)
  file_row = splitter(line, len(order_fill))
  body_row = [None] * len(header)
  if isHeader is True:
    print(file_row) 
    isHeader = False
    continue
  
  # conditions to skip the row - should be added manually here
  # skip if isOriginal is 0
  if file_row[7] == '0':
    continue
  # manual add ends


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
      if set_which[j] == 0:
          continue
      # to set this field
      if body_row[j] == None:
          body_row[j] = "NULL"
      if isStr[j] == 1:
          gen_sql_row += header[j] + " = '" + body_row[j] + "',"
      else:
          gen_sql_row += header[j] + " = " + body_row[j] + ","

  gen_sql_row = gen_sql_row[:-1]

  # where cond
  gen_sql_row += " WHERE "
  for j in where_cond:
      gen_sql_row += header[j[0] - 1] + " = "
      if isStr[j[0] - 1]:
          gen_sql_row += "'" + file_row[j[1] - 1] + "',"
      else:
          gen_sql_row +=  file_row[j[1] - 1] + ","
  
  gen_sql_row = gen_sql_row[:-1]
  gen_sql_row += ";\n"
  f.write(gen_sql_row)


# we have all the final data now, to generate final part of sql_row. TODOS
  #+  "VALUES ('nm0000001','Fred Astaire',1899,'1987','soundtrack,actor,miscellaneous','tt0072308,tt0053137,tt0043044,tt0050419');"
  #now process every row
#f = open("media.sql", "w+")
#for i in range(len(body)):

f.close()
title.close()
