# Minimal Python Flask application
This web application is based an introduction to background worker processes in Heroku, which can be found at the [Heroku Devcenter](https://devcenter.heroku.com/articles/python-rq).

I've made the 'web' process return a job id instead of the actual job result. The job id can be saved by the client, and used subsequently to long-poll the web process. Once the worker is done, when queried with the job id, the web process returns the result.

I've also added app.json and this readme so you can:

## Deploy to Heroku
By clicking the button below.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)