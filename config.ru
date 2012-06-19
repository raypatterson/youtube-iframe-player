require "rack"
require "rack/contrib/try_static"
require "middleman"
require "middleman/builder"

Middleman::Builder.start

use Rack::TryStatic,
    :root => "tmp",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

run lambda {
  [
    404,
    {
      'Content-Type' => 'text/html'
    }, 
    File.open('/404.html', File::RDONLY)
  ]
}