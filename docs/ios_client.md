# Home Power Automation on the Cheap
### iOS Client

In our house iOS is where the apps run natively. Using [Apple Swift](https://developer.apple.com/swift/) a light weight UI was created providing buttons to the API. It's not far off from a generic [Hello World! app](https://www.appcoda.com/learnswift/build-your-first-app.html) with the addition of [how to make an HTTP POST request](https://www.tutorialspoint.com/how-to-make-an-http-post-request-on-ios-app-using-swift).

![iOSPower](/docs/images/app.png)

An iOS app introduced a couple of new hurdles with the already working API. Sinatra serves plain text HTTP and Apple's default policies do not allow this. There are [work arounds](https://stackoverflow.com/questions/32941239/unable-to-access-https-web-service-from-ios) but it is best security practices to encrypt this traffic and a CloudFront CDN makes it easy to do so with the home server as the origin. [Only allowing traffic from CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/LocationsOfEdgeServers.html) will ensure all calls originated through SSL.

The second issue is that [CloudFront strips off GET parameters](https://forums.aws.amazon.com/thread.jspa?threadID=26478), so the args had to be sent and received over POST methods instead.

Source code for the iOS Client is [here](/iOS_client/)

[NEXT](/docs/timers.md)
