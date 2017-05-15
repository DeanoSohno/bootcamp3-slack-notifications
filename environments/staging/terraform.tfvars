#------------------------------------
# General
#------------------------------------

name = "bc3"
region = "eu-west-2"

#------------------------------------
# lambda
#------------------------------------

runtime       = "nodejs6.10"
function_name = "bc34SlackNotifications"
role          = "arn:aws:iam::481807661051:role/service-role/snstoslack-test-role"

channel       = "#devopsbootcamp"
username      = "slackbot"
bc3_hook_id   = "T02GHJB7H/B4TEBGL79/LdRnXvwdSCivcRYWILNtxaiB"