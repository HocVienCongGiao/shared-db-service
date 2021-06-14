"""Python AWS Lambda Hello World Example
   This example Lambda function will simply return 'Hello from Lambda!' and
   a HTTP Status Code 200.
"""

import json
from yoyo import read_migrations
from yoyo import get_backend

# PostgreSQL: database connection
backend = get_backend('postgres://hocvien_dev:123456@crossenv-hvcg.coivn3f0oomk.ap-southeast-1.rds.amazonaws.com/dev_hocvienconggiao')
migrations = read_migrations('./migrations')

def migrate(event, context):
    with backend.lock():
       # Apply any outstanding migrations
       backend.apply_migrations(backend.to_apply(migrations))

       # Rollback all migrations
       # backend.rollback_migrations(backend.to_rollback(migrations))
   
    return {
        'statusCode': 200,
        'body': json.dumps('Migration successful!')
    }
