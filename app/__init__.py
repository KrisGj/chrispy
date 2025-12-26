from flask import Flask

from app.extensions import db, migrate
from app.health import blueprint as health_blueprint


def create_app() -> Flask:
    app: Flask = Flask(__name__)
    app.config.from_object("app.config")

    # Initialize database
    db.init_app(app)
    migrate.init_app(app, db)

    # Register blueprints
    app.register_blueprint(blueprint=health_blueprint)

    return app
