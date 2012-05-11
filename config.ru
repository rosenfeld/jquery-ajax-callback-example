content = %Q{<!DOCTYPE html>
<html>
  <head>
    <title>Example</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
      $.post('/example', function(){ $('body').append('<p>worked without dataType</p>') })
      $.post('/example', function(){ $('body').append('<p>worked with explicit dataType</p>') }, 'text')
    </script>
  </head>
  <body>
  </body>
</html>
}
run Rack::Builder.new {
  map '/' do run ->(env) { [200, {'Content-type' => 'text/html'}, [content]] } end
  map '/example' do run ->(env) { [200, {}, ['']] } end
}
