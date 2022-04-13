## S3 Buckets
* s3.amazonaws.com
* Read: aws s3 ls s3://domain --no-sign-request = Response: An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist
* Upload: aws s3 cp poc.html s3://domain --no-sign-request = load to s3://
* Bruteforce: cat subdomains.txt | xargs -I@ sh -c 'aws s3 ls s3://@ --no-sign-request' | grep -v 'An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist'
