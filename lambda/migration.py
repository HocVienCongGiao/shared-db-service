"""Python AWS Lambda Hello World Example
   This example Lambda function will simply return 'Hello from Lambda!' and
   a HTTP Status Code 200.
"""

# import json
# import os

# from yoyo import read_migrations
# from yoyo import get_backend

from shared-db-app.migration import migrate

# Get environment variables
# DB_USER = os.getenv('DB_USER') # hocvien_dev
# DB_PASSWORD = os.getenv('DB_PASSWORD') # 123456
# DB_NAME =  os.getenv('DB_NAME')  # dev_hocvienconggiao

# PostgreSQL: database connection
# backend = get_backend("postgres://{}:{}@crossenv-hvcg.coivn3f0oomk.ap-southeast-1.rds.amazonaws.com/{}".format(DB_USER, DB_PASSWORD, DB_NAME))
# migrations = read_migrations('./migrations')

def migrate(event, context):
    migrate()
#     with backend.lock():
#        # Apply any outstanding migrations
#        backend.apply_migrations(backend.to_apply(migrations))

#        # Rollback all migrations
#        # backend.rollback_migrations(backend.to_rollback(migrations))
   
    return {
        'statusCode': 200,
        'body': json.dumps('Migration successful!')
    }
