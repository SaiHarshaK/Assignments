from bs4 import BeautifulSoup
import requests, urllib

# Input
domain_name = "www.youtube.com"

# Send request and get webpage
baseurl = "https://www.google.com/search?"
params = {
  "q": domain_name
}
headers = {
  'User-Agent': 'Firefox/3.0.15'
}
url = baseurl + urllib.parse.urlencode(params)
res = requests.get(url, headers=headers, verify=False)
open('/tmp/dbg.html', 'wb').write(res.content)

# Parse Beautiful Soup and get keywords
soup = BeautifulSoup(res.text)
start = soup.get_text().find('ALL')
end = min(soup.get_text().find(''.join([
      'In order to show you the most relevant results, we ',
      'have omitted some entries very similar to the 10 already displayed.']))%10000000,
    soup.get_text().find('Sign inSettingsPrivacyTerms')%10000000)
keywords = soup.get_text()[start:end]

# Return True if string is allowed. Basically eliminating all string that are 
# bad
def disallowed(string):
  # Do not allow empty strings
  if len(string) == 0:
    return False
  # Do not allow strings that are any combination of these letters ONLY
  if all(x in ['.', '|', '<', '>', '›', '-', '—', '_', '\n'] for x in list(set(string))):
    return False
  return True

# Process every raw string - like eliminate new lines from them
def process(string):
  return string.replace('\n', '')
raw_keywords = list(filter(disallowed,  keywords.split(' ')[1:]))
processed_keywords = map(process, raw_keywords)

# Result
print(raw_keywords)