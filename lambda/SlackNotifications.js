var https = require('https');
var util = require('util');

exports.handler = function(event, context) {
    try {
        console.log("----- " + event + " ----------")
        var message = JSON.parse(event.Records[0].Sns.Message);
        //var message = event.Records[0].Sns.Message;

        console.log("- --- -- " + message + " -- -- -- ")

        var channel = process.env.SLACK_CHANNEL
        var username = process.env.SLACK_USERNAME
        var webhookId = process.env.SLACK_WEBHOOK

        var eventType = message.Event;
        var autoScaleGroupName = message.AutoScalingGroupName;
        var description = message.Description;
        var cause = message.Cause;

        var slackMessage = [
            "*Event*: " + eventType,
            "*Description*: " + description,
            "*Cause*: " + cause,
        ].join("\n");

        var postData = {
            channel: channel,
            username: username,
            text: "*" + autoScaleGroupName + "*",
            attachments: [{ text: slackMessage, mrkdwn_in: ["text"] }],
            icon_emoji: ":doom_mad:"
        };

        var options = {
            method: 'POST',
            hostname: 'hooks.slack.com',
            port: 443,
            path: '/services/' + webhookId
        };

        var req = https.request(options, function(res) {
            res.setEncoding('utf8');
            res.on('data', function (chunk) {
                context.done(null);
            });
        });

        req.on('error', function(e) {
            context.fail(e);
            console.log('request error: ' + e.message);
        });

        req.write(util.format("%j", postData));
        req.end();
    } catch (e) {
        context.fail(e)
    }
};