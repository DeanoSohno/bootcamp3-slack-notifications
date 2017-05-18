# Bootcamp 3 Slack Notification 
As par of the bootcamp 3 final project we have decided to add an slack notification interface that allows notifications from the continues integration process to be presented in a slack channel.

## Motivation
As well as to demonstrate how common intercomunication tool like slack allows the shareholders to stay current with the status of the continues integration process.
This development allows us to apply the different skills learnt at the bootcamp and apply best practices in the techniques and technologies been used.
 
### Agile
 
* setting up a project backlog with main ideas, features to be implemented
* estimate effort to implement them and pick the initial one into a spring backlog
* sub-dived the task into a smaller tasks 
* create definition of done 
* implement each task until there are done

### Terraform

* divide the implemtation in modules 
* use varible.tf files to define variables
* use terraform.tfvars to assign initial values

```
├── README.md
├── bootcamp3-slack-notifications.iml
├── environments
│   └── staging
│       ├── main.tf
│       ├── terraform.tfvars
│       └── variable.tf
├── lambda
│   └── SlackNotifications.js
└── modules
    └── notifications
        ├── iam.tf
        ├── lambda.tf
        ├── notifications.tf
        ├── outputs.tf
        ├── subscription.tf
        └── variable.tf
```
### Continues integration 
* Use of git 
* Use master branch to represent production copy
* Use development branch to represent the code been develop a ready tested 
* Use multiple braches from development to implement the different feactures / modules 

```
* 7a02882 - Tue, 16 May 2017 11:12:42 +0100 (5 hours ago) (HEAD )
|           improve message formatting for better visualisation - Juan Carlos Ortega Contreras
*   64cb77b - Mon, 15 May 2017 15:23:29 +0100 (25 hours ago) (development)
|\            Merge pull request #8 from DeanoSohno/terraform-change-region-variable - Dean Sohn
| * cf1c9ba - Mon, 15 May 2017 15:18:01 +0100 (25 hours ago) (terraform-change-region-variable)
| |           terraform state update - Dean Sohn
| * c641e20 - Mon, 15 May 2017 14:58:27 +0100 (25 hours ago)
|/            changed aws reason variable - Dean Sohn
*   b77fcb0 - Mon, 15 May 2017 14:45:52 +0100 (25 hours ago)
|\            Merge pull request #6 from DeanoSohno/terraform-subscription-setup-1 - capJuan
| * d9bcd3f - Mon, 15 May 2017 14:37:28 +0100 (25 hours ago) (terraform-subscription-setup-1)
|/            add subscription and correction to lambda function deployment - Juan Carlos Ortega Contreras
*   5f3f34f - Mon, 15 May 2017 14:00:17 +0100 (26 hours ago)
|\            Merge pull request #4 from DeanoSohno/terraform-iamrole-setup-1 - Dean Sohn
| * 38befed - Mon, 15 May 2017 13:53:33 +0100 (26 hours ago) (terraform-iamrole-setup-1)
|/            initial iamrole setup - Dean Sohn
*   9f6b393 - Mon, 15 May 2017 13:21:00 +0100 (27 hours ago)
|\            Merge pull request #3 from DeanoSohno/terraform-lambda-setup-1 - capJuan
| * 3e44241 - Mon, 15 May 2017 13:17:34 +0100 (27 hours ago) (origin/terraform-lambda-setup-1, terraform-lambda-setup-1)
| |           rename var name to project_name - Juan Carlos Ortega Contreras
| * c92f69d - Mon, 15 May 2017 13:09:13 +0100 (27 hours ago)
| |           typo - Juan Carlos Ortega Contreras
| * cffb4ee - Mon, 15 May 2017 13:03:49 +0100 (27 hours ago)
| |           include enviroment variables - Juan Carlos Ortega Contreras
| *   577ddc3 - Mon, 15 May 2017 12:23:54 +0100 (28 hours ago)
| |\            Merge branch 'development' into terraform-lambda-setup-1 - Juan Carlos Ortega Contreras
| |/  
|/|   
* |   d2ad392 - Mon, 15 May 2017 12:22:16 +0100 (28 hours ago)
|\ \            Merge pull request #2 from DeanoSohno/terraform-sns-setup-1 - Dean Sohn
| * | 3fe3e93 - Mon, 15 May 2017 12:17:21 +0100 (28 hours ago) (origin/terraform-sns-setup-1)
| | |           statefile for terraform - Dean Sohn
| | * 8f22f8e - Mon, 15 May 2017 12:23:07 +0100 (28 hours ago)
| |/            Add Lambda terraform setup - Juan Carlos Ortega Contreras
|/|   
* |   7d7a910 - Mon, 15 May 2017 11:27:14 +0100 (28 hours ago)
|\ \            Merge pull request #1 from DeanoSohno/terraform-sns-setup-1 - Dean Sohn
| |/  
| * cf97117 - Mon, 15 May 2017 11:24:14 +0100 (29 hours ago)
| |           Added variable files for modules - Dean Sohn
| * 12fdf8d - Mon, 15 May 2017 10:57:44 +0100 (29 hours ago)
|/            created sns topic by terraform - Dean Sohn
* 306cf7c - Mon, 15 May 2017 10:26:18 +0100 (29 hours ago)
|           Added title of project to README - Dean Sohn
* 7d7b1dc - Mon, 15 May 2017 10:23:24 +0100 (30 hours ago) (origin/master, origin/HEAD, master)
            Inital commit - Dean Sohn

```

## Installation

Clone repo, navegate to environment/staging , run terraform get , plan, apply .
At the moment the region is eu-west-1 (ireland). 

if you would like to deploy in a new region, please delete the terraform.tfstate file and edit terraform.tfvars to change the region

## API Reference

```
{
  "Event" : "code start",
  "ResultMessage" : "build success",
  "Description" : " Very long description"
}
```

## Contributors

__Juan Carlos Ortega__  
Senior software engineer

__Dean Sohn__  
Software engineer


