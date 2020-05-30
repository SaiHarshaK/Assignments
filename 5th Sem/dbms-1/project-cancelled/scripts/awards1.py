import re
import urllib.request
from html_table_parser import HTMLTableParser

f = open("../imdb/awards_continue_part2.sql", "w+")
title = open("../title.basics_excludeepi_only_ids.tsv", "r")

first_line = 0

while True:
    line = title.readline()
    if first_line == 0:
        first_line = 1
        # ignore first line (its header)
        # print the header now
        header = "tconst\tWinner(1)/Nominee(0)\taward\tawardFor\tName\n"
        f.write(header)
        continue
    if not line:
        break

    line = line[:-1]

    target = 'https://www.imdb.com/title/' + line + '/awards?ref_=tt_awd'
    print(line)
    # get website content
    req = urllib.request.Request(url=target)
    file_req = urllib.request.urlopen(req)
    xhtml = file_req.read().decode('utf-8')
    xhtml = re.sub(r'<div class="award_detail_notes">([^<]*)</div>','',xhtml.strip()) # remove all award descriptions
    # instantiate the parser and feed it
    p = HTMLTableParser()
    p.feed(xhtml)
    #print(p.tables)
    list_of_awards = p.tables
    for awards in list_of_awards:
        winner_mode = 1
        first_of_mode = 1
        award = ""
        award_for = ""
        for row in awards:
            if "Nominee" in row[0]:
                winner_mode = 0
                first_of_mode = 1
            
            award_row = '  '.join(row)
            award_row = award_row.split("  ")
            award_row = [i for i in award_row if i] # remove empty strings in list
            
            print(line, winner_mode, first_of_mode)
            print(award_row)
            if award_row == []:
                continue
            if winner_mode == 1:
                if first_of_mode == 1:
                    first_of_mode = 0
                    if len(award_row) < 3:
                        continue
                    award = award_row[1].strip()
                    award_for = award_row[2].strip()
                    # now for rest of names print into file
                    construct_data_template = line + "\t" + "1\t" + award + "\t" + award_for + "\t"
                    for i in range(3,len(award_row)):    
                        construct_data = construct_data_template
                        construct_data += award_row[i] + "\n"
                        f.write(construct_data)
                else:
                    award_for = award_row[0].strip()
                    construct_data_template = line + "\t" + "1\t" + award + "\t" + award_for + "\t"
                    for i in range(1,len(award_row)):
                        construct_data = construct_data_template
                        construct_data += award_row[i] + "\n"
                        f.write(construct_data)
            else: # nominee
                if first_of_mode == 1:
                    first_of_mode = 0
                    if len(award_row) < 3:
                        continue
                    award = award_row[1].strip()
                    award_for = award_row[2].strip()
                    # now for rest of names print into file
                    construct_data_template = line + "\t" + "0\t" + award + "\t" + award_for + "\t"
                    for i in range(3,len(award_row)):
                        construct_data = construct_data_template
                        construct_data += award_row[i] + "\n"
                        f.write(construct_data)
                else:
                    award_for = award_row[0].strip()
                    construct_data_template = line + "\t" + "1\t" + award + "\t" + award_for + "\t"
                    for i in range(1,len(award_row)):
                        construct_data = construct_data_template
                        construct_data += award_row[i] + "\n"
                        f.write(construct_data)

f.close()
title.close()
