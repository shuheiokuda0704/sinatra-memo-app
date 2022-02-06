require 'sinatra'
require 'sinatra/reloader'
require_relative 'models/memo'

get '/' do
  redirect to('/memos')
end

get '/memos' do
  @memos = Memo.all
  erb :index
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  @memo = Memo.find params[:id]

  erb :detail
end

get '/memos/:id/edit' do
  @memo = Memo.find params[:id]

  erb :edit
end

post '/memos' do
  memo = Memo.create(params)

  redirect to("memos/#{memo.id}")
end

patch '/memos/:id' do
  memo = Memo.find params[:id]

  memo.update(params)

  redirect to("memos/#{memo.id}")
end

delete '/memos/:id' do
  memo = Memo.find params[:id]
  memo.destroy

  redirect to('/memos')
end
