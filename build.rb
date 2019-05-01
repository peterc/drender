require 'erb'
require 'open-uri'
require 'json'
require 'time'

CACHE_FOLDER = "/opt/build/cache"

if Dir.exist?("_site")
  puts "Deleting any build artefacts"
  `rm -f _site/*` 
else
  puts "Making build directory"
  Dir.mkdir("_site") 
end

puts "Copying static files to build directory"
`cp site/* _site/`

puts "Rendering dynamic stuff"

out = open('https://drudge2.herokuapp.com/live').read
File.open("_site/index.html", "w") { |f| f.puts out }

puts "Done"