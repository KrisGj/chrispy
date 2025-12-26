from decouple import config

SQLALCHEMY_DATABASE_URI = config("DATABASE_URL", default="postgresql+psycopg://postgres:postgres@db:5432/app_db")
SQLALCHEMY_TRACK_MODIFICATIONS = False
