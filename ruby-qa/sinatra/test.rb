#test.rb
require 'sinatra'
require 'haml'

get '/' do  
    haml :index  
end

get '/reports' do
    haml :reports
end

get '/analyzer' do
    haml :analyzer
end

get '/environment' do
    haml :environment
end





