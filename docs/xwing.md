# Home Power Automation on the Cheap
### X-Wing Client

Written with [Ruby2D](http://www.ruby2d.com) a [SDL2](https://www.libsdl.org) wrapper that makes writing simple games easy.

```ruby
require 'ruby2d'

xwing = Sprite.new(
  'images/xwing_21sprite.png',
  clip_width: 21,
  time: 100,
  animations: {
    fly: 0..3,
    explode: 4..8
  }
)
```

![xwing](/xwing_client/images/xwing.png)
