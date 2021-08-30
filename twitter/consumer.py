from tweepy import OAuthHandler, Cursor, API as tweepy_API
from avro.datafile import DataFileWriter
from avro.io import DatumWriter
import avro.schema
import shutil
import uuid
import os


oauth = OAuthHandler(
    os.getenv('consumer_key'),
    os.getenv('consumer_secret'))

oauth.set_access_token(
    os.getenv('access_token'),
    os.getenv('access_secret'))

api = tweepy_API(oauth)

schema = avro.schema.parse(open('tweet.avsc', 'rb').read())

last_id = None
output_dir = '/usr/tweets'

for index in range(10):
    output_filename = f'{str(uuid.uuid4())}.avro'
    writer = DataFileWriter(open(f'/tmp/{output_filename}', 'wb'), DatumWriter(), schema)
    for tweet in api.search(q='santander', count=100, lang='pt', since_id=last_id):
        writer.append({'text': tweet.text, 'created_at': str(tweet.created_at)})
        last_id = tweet.id
    writer.close()
    shutil.move(f'/tmp/{output_filename}', f'{output_dir}/{output_filename}')
