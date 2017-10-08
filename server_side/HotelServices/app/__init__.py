__author__ = 'waqar'

import os

from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
from flask_limiter import Limiter


basedir = os.path.abspath(os.path.dirname(__file__))

db = SQLAlchemy()
limiter = Limiter()


def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'data.sqlite')
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
    limiter.init_app(app)

    db.init_app(app)
    db.app = app
    db.create_all()

    from api_1 import api as api_1_0_blueprint
    app.register_blueprint(api_1_0_blueprint, url_prefix='/api/v1.0')
    return app

