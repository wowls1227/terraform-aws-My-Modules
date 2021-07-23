resource "aws_s3_bucket" "test1" {

	bucket ="${var.prefix}-${var.bucket_name}"
	acl = "public-read"
	

 website {
	index_document = "index.html"
}
 force_destroy =true
}

resource "aws_s3_bucket_object" "testWep" {
 acl = "public-read"
 key = "index.html"
 bucket = aws_s3_bucket.test1.id
 content = file("${path.module}/assets/index.html")
 content_type = "text/html"

}
