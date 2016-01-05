from app import create_app, db
from app.models import User, Permission, Menu, MenuTag
from flask.ext.script import Manager, Shell
from flask.ext.migrate import Migrate, MigrateCommand
import logging
import logging.config, yaml


app = create_app()
manager = Manager(app)
migrate = Migrate(app, db)

logging.config.dictConfig(yaml.load(open('logging.conf')))
log_file = logging.getLogger('file')
log_console = logging.getLogger('console')


def make_shell_context():
    return dict(app=app, db=db, User=User, Permission=Permission, Menu=Menu, MenuTag=MenuTag)


manager.add_command("shell", Shell(make_context=make_shell_context))
manager.add_command('db', MigrateCommand)

if __name__ == '__main__':
    manager.run()

