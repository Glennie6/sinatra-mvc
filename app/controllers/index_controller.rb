get '/:birthdate' do
  setup_index_view
end

get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = get_message(birth_path_num)
  erb :index
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-", "")
  if valid_birthdate(birthdate)
    birth_path_num = Person.get_birth_path_num(birthdate)
    redirect "/message/#{birth_path_num}"
  else
    @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
    erb :form    
  end
end


