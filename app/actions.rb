# Homepage (Root path)
get '/' do
  erb :index
end

post '/submitsong' do
	erb :submitsong
end
