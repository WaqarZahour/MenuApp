__author__ = 'waqar'

from flask.ext.httpauth import HTTPBasicAuth
from .. models import User
from . import api
from manage import log_console

auth = HTTPBasicAuth()


@auth.verify_password
def verify_password(email, password):
    user = User.query.filter_by(email=email).first()
    if not user:
        return False
    log_console.info("password verified")
    return user.verify_password(password)


@api.before_request
@auth.login_required
def before_request():
    log_console.info("before request")
