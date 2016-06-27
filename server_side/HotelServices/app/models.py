__author__ = 'waqar'

from werkzeug.security import generate_password_hash, check_password_hash
from . import db


class Permission(db.Model):
    __tablename__ = 'permissions'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)
    permission_level = db.Column(db.Integer)
    users = db.relationship('User', backref='permission', lazy='dynamic')

    def __repr__(self):
        return '<Permission %r>' % self.name


class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(64), unique=True, index=True)
    permission_id = db.Column(db.Integer, db.ForeignKey('permissions.id'))
    password_hash = db.Column(db.String(128))
    name = db.Column(db.String(64))

    @property
    def password(self):
        raise AttributeError('password is not a readable attribute')

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)

    def __repr__(self):
        return '<User %r>' % self.email


class Menu(db.Model):
    __tablename__ = 'menu'
    id = db.Column(db.Integer, primary_key=True)
    dish_name = db.Column(db.String(64), unique=True, index=True)
    price = db.Column(db.Integer)
    tag_id = db.Column(db.Integer, db.ForeignKey('menu_tag.id'))

    def to_json(self):
        json_menu = {
            'item_name': self.dish_name,
            'price': self.price,
        }
        return json_menu

    def __repr__(self):
        return '<Menu %r>' % self.dish_name


class MenuTag(db.Model):
    __tablename__ = 'menu_tag'
    id = db.Column(db.Integer, primary_key=True)
    tag_name = db.Column(db.String(64), unique=True, index=True)
    menu = db.relationship('Menu', backref='menutag', lazy='dynamic')

    def __repr__(self):
        return '<MenuTag %r>' % self.tag_name
