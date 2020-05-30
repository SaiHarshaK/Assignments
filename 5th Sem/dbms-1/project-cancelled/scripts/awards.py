import pandas as pd
url = 'https://www.imdb.com/title/tt2395427/awards?ref_=tt_awd'
tables = pd.read_html(url) # Returns list of all tables on page
print(len(tables))
for i in tables:
    print("len: ", len(i))
    print(i)
    print("next")
#sp500_table = tables[0] # Select table of interest
