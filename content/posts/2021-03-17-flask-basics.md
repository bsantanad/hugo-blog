---
title: learning flask basics
date: 2021-03-17 08:21:00
draft: false
---

# Flask

_All this blog is based on the [flaskr-tutorial][flaskr]
go check that for more detailed instructions._

## basics

It is good to organize code into multiple modules that can be imported
when needed (do not use a single file for the whole web app)

project layout:

- main-folder
    - web-app
        - \_\_init.y\_\_
        - auth.py
        - templates (html)
        - static (css)
    - tests
    - venv

Good .gitingore  for a project like this
```shell
venv/
.venv

*.pyc
__pycache__/

instance/

.pytest_cache/
.coverage
htmlcov/

dist/
build/
*.egg-info/
```

## app setup

A flask app is an instance of the flask class. We could write it on top
of our _app.py_, and then add all the routes or endpoints below, but that
is not scalable. What we will do is create this instance inside a function,
this function is known as _The application factory_

This app factory will be coded in the _web-app_ folder, from the tree
above and it will be in the  \_\_init.y\_\_ file,

For and example go [here][factory]

In order to run the app this way we will need to go out to the _main-folder_
and set some variables
```shell
% export FLASK_APP=flaskr
% export FLASK_ENV=development
```
then we can just
```shell
% flask run
```
and it's all done.

**NOTE:** development mode shows and interactive debugger and reloads the
page everytime you make a change to the code. This is just for development
purposes.

## db

In the tutorial they use _sqlite3_, it's cool and all, but it happens to
have concurrent requests it will slow down as each write happens sequentially.

So for big projects they're a big no no, I would recommend __sqlalchemy__.
I will cover it here in the future, but for now go look how that work in
some other place.

## blueprints and views

A view function is the code you write to respond to requests to your
application.

A blueprint is a way to organize a group of related views and other code.

For example, we will have a blueprint for authenticate users in a file
called _auth.py_.
```python
import flask

bp = flask.Blueprint('auth', __name__, url_prefix='/auth')
```
Then we go to out \_\_init.py\_\_ file and add:
```python
def create_app():
    # some code ....
    from . import auth
    app.register_blueprint(auth.bp)

    return app
```

Then we can make the endpoint
```python
@bp.route('/register', methods=('GET', 'POST'))
def register():
    # code ...
```
So the route or endpoint when we try to access that function would be
**/auth/register**.

makes sense?

Finally, there's a function called, flask.url\_for(), this will return
the url based on the arguments, using blueprints we could use
```python
flask.url\_for('auth.register')
```
You can see a code example [here][blueprints]

## templates

**TODO...**



[factory]: https://flask.palletsprojects.com/en/1.1.x/tutorial/factory/
[flaskr]: https://flask.palletsprojects.com/en/1.1.x/tutorial/
[blueprints]: https://flask.palletsprojects.com/en/1.1.x/tutorial/views/
