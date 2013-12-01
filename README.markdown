# AVCapture wrapper

* https://github.com/tenderlove/av_capture

## DESCRIPTION:

Wraps up AVCapture and exposes it to Ruby.

## FEATURES/PROBLEMS:

* Not particularly easy to use right now

### SYNOPSIS:

Capture an impage:

```ruby
session = AVCapture::Session.new # AVCaptureSession
dev     = AVCapture.devices.find(&:video?) # AVCaptureDevice

p dev.name
p dev.video?
output  = AVCapture::StillImageOutput.new # AVCaptureOutput subclass
session.add_input dev.as_input
session.add_output output

session.run do
  connection = output.video_connection

  ios = 5.times.map {
    io = output.capture_on connection
    sleep 0.5
    io
  }

  ios.each_with_index do |io, i|
    File.open("x_#{i}.jpg", 'wb') { |f| f.write io.data }
  end
end
```

## REQUIREMENTS:

* FIX (list of requirements)

== INSTALL:

* FIX (sudo gem install, anything else)

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
