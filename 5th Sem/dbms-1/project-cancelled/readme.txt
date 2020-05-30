Python packages used
* html-table-parser-python3

Print first column from file
$ cat ../imdb/title.basics.tsv | sed 's/|/ /' | awk '{print $1}'
Seperate dataset into episode related and movies related
$ grep tvEpisode > ep_data
$ grep -v tvEpisode > non-ep_data

Use award.py script using the html-table-parser-python3, to get list of all tables. parse them to the info we need. (dataset)

used 'NULL' to reference null ones

I used $ split, to split the huge .sql file to multiple smaller ones
$ split -l 20000 -d media.sql media/media-part-

for running all sql files in a folder
  SCRIPTS_DIR=/home/ubuntu/sql-files/media
  DATABASE_NAME=postgres

  for file in $SCRIPTS_DIR/*
      do sudo -u postgres psql $DATABASE_NAME -f $file
  done

made script which executes the generated sql commands

