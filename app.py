import os
from flask import Flask, request, jsonify
from utils import count_words_at_url
import datetime

app = Flask(__name__)

@app.route("/data")
def handle_job():
    output = count_words_at_url('http://heroku.com')
    return jsonify(output)

@app.route("/login")
def login_page():
    return f'This is the login page. The current time is {datetime.datetime.now()}'

@app.route("/page<page_id>")
def other_page(page_id):
    return f'This is page {page_id}. The current time is {datetime.datetime.now()}'

if __name__ == "__main__":
    app.run(
        host=os.environ.get('HOST', '0.0.0.0'),
        port=os.environ.get('PORT', 5000),
        threaded=False)
