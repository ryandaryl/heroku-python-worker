import os
from flask import Flask
from rq import Queue
from worker import conn
from utils import count_words_at_url

app = Flask(__name__)
q = Queue(connection=conn)

@app.route("/")
def hello():
    new_job = q.enqueue(count_words_at_url, 'http://heroku.com')
    return str(new_job.result)

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)