require 'bundler'
Bundler.setup(:default)
Bundler.require

load 'models/left.rb'
load 'models/right.rb'

DataMapper.setup(:default, 'postgres://efatsi@localhost/tshirt_cannon')
DataMapper.finalize

get '/' do
  erb :home
end

post '/click' do
  if params[:direction] == 'left'
    Left.increment
  elsif params[:direction] == 'right'
    Right.increment
  end

  { :success => true }.to_json
end
