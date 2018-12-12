describe aws_s3_bucket('sagemaker-sample-bucket') do
	it { should exist }
end

describe aws_s3_bucket('no-exist-bucket') do
	it { should exist }
end