from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from loguru import logger

SQLALCHEMY_DATABASE_URL = "postgresql://postgres:Password123!@localhost:5432/kkpr_db"

engine = create_engine(SQLALCHEMY_DATABASE_URL)

try:
    engine.connect()
    logger.info("Database connection established")
except Exception as e:
    logger.error(f"Database connection failed: {e}")
    raise e


SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
