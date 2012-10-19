[![express-city](https://photos-5.dropbox.com/t/0/AACamN0ShDtdtVngKsOQUuS7dKUaRGWgzk2yK6Umnz3AGA/10/112615465/jpeg/1024x768/2/1350619200/0/2/express-city.jpg/4qUmj_Dw3CP7s3duz9wJTHfzixXqxGdYPR7Ld5Y6CaY)](https://github.com/geta6/express-city)

  Web application template for [nodejs](http://nodejs.org) based on [express](http://expressjs.com)

## Requirement

  * NodeJS
  * MongoDB


## Describer

  * `express`: Web-application framework
  * `mongoose`: ORM for MongoDB
  * `jade`: html describer
  * `stylus`: css describer
  * `coffee-script`: js describer
  * `bootstrap-2.1.1`: style template


## Quick Start

  Start coding:

    $ git clone https://github.com/geta6/express-city
    $ cd express-city

  Install dependencies:

    $ npm install

  Start the server:

    $ node index

  or

    $ node .

  Daemonize the server with production environment:

    $ npm install -g forever
    $ npm start

  Stop daemonized server:

    $ npm stop

  or

    $ forever list
    # find uid of 4 chars like `upb4`
    $ forever stop $UID


## Future

  * Tests
  * Example


## License

(The MIT License)

Copyright (c) 2012 geta6

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
