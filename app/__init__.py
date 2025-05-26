from flask import Flask

from app.health import blueprint as health_blueprint


def create_app() -> Flask:
    app: Flask = Flask(__name__)

    # Register blueprints
    app.register_blueprint(blueprint=health_blueprint)

    return app
