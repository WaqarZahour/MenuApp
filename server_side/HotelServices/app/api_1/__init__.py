__author__ = 'waqar'

from flask import Blueprint
from flask_restful import Api

api = Blueprint('api', __name__)

from . import authentication
from resources.menu import Menu

api_v1 = Api(api)
api_v1.add_resource(Menu, '/menu/')


