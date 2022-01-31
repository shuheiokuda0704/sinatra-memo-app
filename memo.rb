require 'sinatra'

get '/' do
  'redirect to memos'
end

get '/memos' do
  'show memos page'
end

get '/memos/:id' do
  'show memos/:id page'
end

get '/memos/new' do
  'show memos/new page'
end

get '/memos/:id/edit' do
  'show memos/:id/edit page'
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