require 'sinatra'

get '/' do
  redirect to('/memos')
end

get '/memos' do
  erb :index
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  # @memo = Memo.find params[:id]
  erb :detail
end


get '/memos/:id/edit' do
  # @memo = Memo.find params[:id]
  erb :edit
end

post '/memos' do
  'create new memo'
end

patch '/memos/:id' do
  'update memo'
end

delete '/memos/:id' do
  'delete memo'
end