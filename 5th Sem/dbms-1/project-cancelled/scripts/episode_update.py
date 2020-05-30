import itertools 

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

tableName = "episode"
header = ["episode_ID", "media_ID", "run_time", "orignal_title", "release_date", "season_no", "episode_no", "budget", "language_name"]
isStr  = [1, 1, 0, 1, 0, 0, 0, 0, 1]
isMulti = [0, 0, 0, 0, 0, 0, 0, 0, 1] # for multivalued. if in dataset it is seperated by ','

# generate sql query
sql_row = "INSERT INTO " + tableName + "("
for index in header:
  sql_row += index + ","

sql_row = sql_row[:-1]
sql_row += ") VALUES ("

#body = []

# do for seperate datasets
f = open("episode_update.sql", "w+")
title = open("imdb/title.episode.tsv", "r")

order_fill = [1,2,6,7] # index 1. -1 -> ignore

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

  #if value is of str only then have to add ''
  print(body_row)
  # pre process body_row to convert None to NULL
  for j in range(len(body_row)):
      if body_row[j] == None:
          body_row[j] = "NULL"

  # now create all possible combinations
  multi_body_row = []
  for j in range(len(isMulti)):
    if isMulti[j] == 0:
        multi_body_row.append([body_row[j]])
    else:
        list_val = body_row[j].split(",")
        list_val = [x for x in list_val if x != []]
        multi_body_row.append(list_val)

  res = list(itertools.product(*multi_body_row.append)) 

  for val in res:
      gen_sql_row = sql_row
      for j in range(len(val)):
      if isStr[j] == 1:
          gen_sql_row += "'" + val[j] + "',"
      else:
          gen_sql_row += val[j] + ","

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

