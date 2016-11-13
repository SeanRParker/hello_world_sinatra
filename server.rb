require 'rubygems'
require 'sinatra'
require 'pry'
require 'babbler'
require 'Haml'

# DSL - Domain Specific Language

# Root URL
get '/' do
  haml :home
end

# binding.pry
get '/sean' do
  "Yo!"
end

get '/hello' do
  "Hello"
end

# params is just a ruby hash
#  Dynamic route
get '/hello/:name' do
  "Hello, #{params[:name]}"
end

get '/hello/:name/:age' do
  age = params[:age].to_i + 10
  "#{params[:name]}, you will be #{age} in 10 years."
end

# Query String
# http://localhost:4567/sport?favorite=longboard
# http://localhost:4567/sport?favorite=longboard&name=sean

#  Query String Parameters
get '/sport' do
  haml :sport
end

get '/secret' do
  haml :secret
end

get '/zoo' do
  @animals = [
    'Jake Sorce',
    'Dave Jungst',
    'Ty Diamse',
    'Will Liang',
    'Bending Nhi',
    'Somebody',
    'Someone Else'
  ]
  @name = 'Jakey Dude'
  haml :zoo
end

post '/secret' do
  params[:message].reverse
end

get '/numbers' do
  @numbers = [1,2,3,4,5,6,7,8,9,10]
  haml :numbers
end


not_found do
  status 404
  'no one here, go to a real page'
end
