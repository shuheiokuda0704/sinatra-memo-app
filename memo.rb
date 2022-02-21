# frozen_string_literal: true

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

get '/memos/notfound' do
  erb :notfound
end

get '/memos/:id' do
  @memo = Memo.find params[:id]
  redirect to('memos/notfound') unless @memo

  erb :detail
end

get '/memos/:id/edit' do
  @memo = Memo.find params[:id]
  redirect to('memos/notfound') unless @memo

  erb :edit
end

get '/*' do
  redirect to('memos/notfound') unless @memo
end

post '/memos' do
  memo = Memo.create(params)

  redirect to("memos/#{memo.id}")
end

patch '/memos/:id' do
  memo = Memo.find params[:id]
  redirect to('memos/notfound') unless memo

  memo.update(params)
  redirect to("memos/#{memo.id}")
end

delete '/memos/:id' do
  memo = Memo.find params[:id]
  redirect to('memos/notfound') unless memo

  memo.destroy
  redirect to('/memos')
end

helpers do
  def escape(text)
    Rack::Utils.escape_html(text)
  end
end
