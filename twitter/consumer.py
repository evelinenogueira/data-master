from tweepy import OAuthHandler, Cursor, API as tweepy_API
from avro.datafile import DataFileWriter
from avro.io import DatumWriter
import avro.schema
import hashlib
import shutil
import uuid
import os
import csv

oauth = OAuthHandler(
    os.getenv('consumer_key'),
    os.getenv('consumer_secret'))

oauth.set_access_token(
    os.getenv('access_token'),
    os.getenv('access_secret'))

api = tweepy_API(oauth)


last_id = None
output_dir = '/usr/tweets'


for index in range(10):
    csvFile = open(f'{output_dir}/tweets.csv','a')
    csvWriter = csv.writer(csvFile)
    csvWriter.writerow(['text', 'created_at','user'])
    for tweet in api.search(q='santander', count=100, lang='pt', since_id=last_id):
        csvWriter.writerow([tweet.text, str(tweet.created_at), hashlib.sha256(str(tweet.user.screen_name).encode()).hexdigest()])
        last_id = tweet.id
    csvFile.close()

