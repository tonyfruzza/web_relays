# Home Power Automation on the Cheap
### Timers
These things get dragged out mostly at Christmas used to turn on our tree lights and some of the lights for outdoors. They should be turned on and off at planned intervals.

This could be accomplished a couple different ways. I chose to subscribe the API end point to a SNS topic that is triggered by a CloudWatch Alert containing the device ID to toggle. The advantage of this over a crontab entry is that there is already an API created to manage CloudWatch Alert times. Similar to Email subscriptions HTTP(S) end points require subscribers to [confirm their subscription](https://docs.aws.amazon.com/sns/latest/dg/sns-http-https-endpoint-as-subscriber.html). In order to do this the POST data was printed to debut output to access the subscription end point. Once confirmed it could be used to manipulate any of the switches with the payload included.

![CW](/docs/images/cw_alert_on.png)

[NEXT](/docs/xwing.md)
