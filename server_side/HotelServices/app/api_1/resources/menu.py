from ... import limiter
from ... models import MenuTag as menu_tag_model
from flask_restful import Resource, fields, marshal_with


class Menu(Resource):

    menu_fields = {'dish_name': fields.String, 'price': fields.Integer}
    resource_fields = {'tag_name': fields.String, 'menu': fields.List(fields.Nested(menu_fields))}
    decorators = [limiter.limit("10/minute"), marshal_with(resource_fields)]

    @marshal_with(resource_fields)
    def get(self):
        menu_tags = menu_tag_model.query.all()
        return menu_tags
