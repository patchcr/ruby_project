#test.rb
require 'sinatra'
require 'haml'

get '/' do  
    haml :index  
end

get '/reports' do
    haml :reports
end

get '/analysis' do
    haml :analysis
end





