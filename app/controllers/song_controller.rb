# require 'sinatra/base'
#
# require 'rack-flash'
class SongController < ApplicationController
  # enable :sessons
  # use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @artist = Artist.find_or_create_by(name: params[:artist])
    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save
    # flash[:message] = "Successfully created song."
    redirect  "/songs/#{@song.slug}"
    # @song.artist =
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = params[:genre_id][]
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
