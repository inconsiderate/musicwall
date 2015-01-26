set :sessions => true

# Homepage (Root path)
get '/' do
	if session[:user_id]
		@user = User.find(session[:user_id])
	end
  erb :index
end

post '/newsong' do 
	@newsong = Song.create(
		title: params[:title],
		artist: params[:artist],
		link: params[:link]
		)
	@newsong.save
	redirect '/songview'
end


get '/songview' do
	if session[:user_id]
		@user = User.find(session[:user_id])
	end
	@songs = Song.all
	erb :'songview'
end

get '/login' do 
end

post '/login' do
	response.set_cookie('first', 'second') 
	@user = User.find_by username: params[:username]
	if @user == nil
		redirect '/newuser'
	elsif @user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/songview'
	else
		redirect '/newuser'
	end
end

post '/newuser' do 
	@user = User.create(
		username: params[:username],
		password: params[:password],
		)
	if @user.save
		redirect '/songview'
	else
		erb :'/index'
	end
end