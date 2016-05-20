require 'sinatra'
require 'pry'
require 'babbler'

# DSL - Domain Specific Language

# Root URL
get '/' do
  "Hello World!"
end

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

#  Query String Parameters
get '/sport' do
  name = params[:name]
  if params[:favorite] == 'longboard'
    "you are awesome, #{name}!"
  else
    "Cruise or die #{name}!"
  end
end

# Query String
# http://localhost:4567/sport?favorite=longboard
# http://localhost:4567/sport?favorite=longboard&name=sean


get '/secret' do
  erb :secret
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
  erb :zoo
end

get '/numbers' do
  @numbers = [1,2,3,4,5,6,7,8,9,10]
  erb :numbers
end

post '/secret' do
  params[:message].reverse
end

not_found do
  status 404
  'no one here, go to a real page'
end
