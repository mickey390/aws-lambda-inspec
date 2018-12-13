# overview

- Exec Sample [Inspec](https://www.inspec.io/) testing on AWS Lambda

```
├── README.md
├── functions 
│   └── dev
│       ├── Gemfile
│       ├── Gemfile.lock
│       ├── function.json //apex conf
│       ├── index.rb //lambda 
│       ├── spec   //inspec test code deirectory 
│       └── vendor //bundle directory
├── infrastructure //apex infra directory
│   ├── dev
│   │   ├── main.tf
│   │   ├── terraform.tfstate
│   │   └── variables.tf
│   └── modules
│       └── iam
└── project.json // apex conf
```

- local pc : macOS(10.14.1)
- function deploy : [apex](https://github.com/apex/apex)
- Sample spec : [Is some aws bucket exist?](https://github.com/mickey390/aws-lambda-inspec/blob/master/functions/dev/spec/s3_spec.rb)

## library download

```
[local] docker run -it -v "$PWD":/var/task lambci/lambda:build-ruby2.5 bash

[docker]bash-4.2# cd functions/dev/
[docker]bash-4.2# bundle install --path vendor/bundler
```

## create IAM role for AWS Lambda (by apec infra/terraform)

```
# create symlink
apex infra get
# check
apex infra plan -target=module.iam
# apply
apex infra apply -target=module.iam
```

## deploy & invoke function to AWS Lambda (by apex)

```
# deploy
[local] apex deploy dev
# invoke
[local] apex invoke dev
# show logs
[local] apex logs
```

