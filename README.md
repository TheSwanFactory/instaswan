# instaswan

Instaswan is a Ruby on Rails clone developed during a training exercise for the Firehose code school.

# Technologies
* Rails apps
* Ruby on Rails 5.0 pre-release
* Heroku
* Puma 
* S3

# Tutorials

* https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
* https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
  * http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html#how-do-i-enable-cors
  * http://stackoverflow.com/questions/30350785/trying-to-set-up-amazons-s3-bucket-403-forbidden-error-setting-permissions
  * http://stackoverflow.com/questions/30358220/writing-an-iam-policy-and-cors-configuration-for-amazon-s3

Note: The default Heroku instructions for S3 uploads are incorrect. You need to specify your exact region, and setup a Bucket Policy:
```
{
	"Version": "2008-10-17",
	"Statement": [
		{
			"Sid": "AllowFileUpload",
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::XXXXXXXX:user/instaswan"
			},
			"Action": [
				"s3:PutObject",
				"s3:PutObjectAcl"
			],
			"Resource": [
				"arn:aws:s3:::instaswan-dev",
				"arn:aws:s3:::instaswan-dev/*"
			]
		}
	]
}
```
