# Home Power Automation on the Cheap
### Web Server
The web server is what bridges the hardware to the internet. All that is needed is a simple API, not an elaborate MVC framework, so I chose [Sinatra](https://github.com/sinatra/sinatra). With a few lines of [code](/web_server/lightswitch.rb) a multi functional API was born within that runs in `screen`.

The web server operates over HTTP and the port is open through my router. The initial version of it accepted GET requests to pass in which device to toggle. Later you'll see why this wasn't possible.

[NEXT](/docs/web_client.md)
