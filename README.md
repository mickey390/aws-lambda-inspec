# OVERVIEW

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

## library donwload

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

## deploy function to AWS Lambda (by apex)

```
apex deploy dev
```

