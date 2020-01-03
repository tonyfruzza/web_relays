# Home Power Automation on the Cheap
### Web Server
The web server is what bridges the hardware to the internet. All that is needed is a simple API, not an elaborate MVC framework, so I chose [Sinatra](https://github.com/sinatra/sinatra). With a few lines of [code](/web_server/lightswitch.rb) a multi functional API was born within that runs in `screen`.

```ruby
require 'rack/contrib'

post '/v1/intermittent_on' do
  request.body.rewind
  puts params
  puts data = JSON.parse(params.first)
  `usbrelay #{data['id']}=1`
  sleep 0.5
  `usbrelay #{data['id']}=0`
end
```

The web server operates over HTTP and the port is open through my router. The initial version of it accepted GET requests to pass in which device to toggle. Later you'll see why this wasn't possible.

[NEXT](/docs/web_client.md)
