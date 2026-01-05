import boto3
from datetime import datetime


dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('file_uploads')


def lambda_handler(event, context):
record = event['Records'][0]


table.put_item(
Item={
'file_name': record['s3']['object']['key'],
'bucket': record['s3']['bucket']['name'],
'size': record['s3']['object']['size'],
'uploaded_at': datetime.utcnow().isoformat()
}
)


return {"status": "logged"}
