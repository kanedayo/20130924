# coding: utf-8
require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'
require "active_record"

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/bbs.sqlite'
)

set :haml, {:format => :html5 }

configure :development do
  Slim::Engine.set_default_options :pretty => true
end

class Sample < ActiveRecord::Base
end

get '/' do
  @bbs = Sample.all
  haml:bbs
end

post '/' do
  Sample.create(
    :title => params[:title],
    :ctime => Time.now
    )
  @bbs = Sample.all
  haml:bbs
end

post '/delete' do
  Sample.find(params[:id]).destroy
end