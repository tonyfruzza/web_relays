# Home Power Automation on the Cheap
### iOS Client

![iOSPower](/docs/images/app.png)

In our house iOS is where the apps run natively. Using [Apple Swift](https://developer.apple.com/swift/) a light weight UI was created providing buttons to the API. It's nor far off from a generic [Hello World! app](https://www.appcoda.com/learnswift/build-your-first-app.html) with the addition of [how to make an HTTP POST request](https://www.tutorialspoint.com/how-to-make-an-http-post-request-on-ios-app-using-swift).

There's a couple hurdles introduced. The Sinatra server is plain text HTTP server and iOS is not happy. There are [work arounds](https://stackoverflow.com/questions/32941239/unable-to-access-https-web-service-from-ios) but it was easier to create a CloudFront CDN with the home server as the origin. You can make use of the generic CloudFront SSL cert or your own.

The second issue is that [CloudFront strips off GET parameters](https://forums.aws.amazon.com/thread.jspa?threadID=26478), so the args had to be sent and received over POST methods instead.

Source code for the iOS Client is [here](/iOS_client/)

[NEXT](/docs/timers.md)
