# AVCapture wrapper

* https://github.com/tenderlove/av_capture

## DESCRIPTION:

Wraps up AVCapture and exposes it to Ruby.  This gem only works on OS X.

## FEATURES/PROBLEMS:

* This gem only works on OS X
* Not particularly easy to use right now
* This gem only works on OS X
* This gem only works on OS X
* This gem only works on OS X
* This gem only works on OS X
* This gem only works on OS X

### SYNOPSIS:

Capture an image:

```ruby
require 'av_capture'

session = AVCapture::Session.new
dev     = AVCapture.devices.find(&:video?)

p dev.name
p dev.video?

session.run_with(dev) do |connection|
  2.times do |i|
    File.open("x_#{i}.jpg", 'wb') { |f|
      f.write connection.capture
    }
    sleep 1
  end
end
```

## REQUIREMENTS:

* You'll need to be running OS X to use this gem.

* Because this gem depends on Apple's AVFoundation framework for
  access to the camera, you'll need to install 
  [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) and
  its [command-line](http://stackoverflow.com/a/9329325/798224)
  tools before building or installing.

## INSTALL:

Compile and run the test suite to make sure you have all the necessary
compile-time dependencies:

```sh
bundle
rake
```

Install the gem:

```sh
rake install_gem
```

You may need to run `sudo rake install_gem` depending on your Ruby
installation.

## LICENSE:

(The MIT License)

Copyright (c) 2013 Aaron Patterson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
