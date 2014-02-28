require 'bundler'
Bundler.setup(:default)
Bundler.require

load 'models/left.rb'
load 'models/right.rb'

DataMapper.setup(:default, ENV["TSHIRT_POSTGRESQL_URL"])
DataMapper.finalize

begin
  Left.count
rescue
  DataMapper.auto_migrate!
  Left.create(:count => 1)
  Right.create(:count => 1)
end

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
