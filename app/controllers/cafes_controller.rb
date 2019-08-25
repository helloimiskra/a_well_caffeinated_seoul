class CafesController < ApplicationController

    get '/cafes' do
        @cafes = Cafe.all
        erb :'cafes/all'
    end


    get '/cafes/new' do
        erb :'cafes/create_cafe'
    end

    post '/cafes' do
        @cafe = Cafe.create(params)
        redirect to "/cafes/#{@cafe.id}"
    end

    get '/cafes/:id' do
        @cafe = Cafe.find_by_id(params[:id])
        erb :'cafes/show_cafe'
    end

    get '/cafes/:id/edit' do
        @cafe = Cafe.find_by_id(params[:id])
        erb :'cafes/edit_cafe'
    end

    patch '/cafes/:id' do
        @cafe = Cafe.find_by_id(params[:id])
        @cafe.name = params[:name]
        @cafe.location = params[:location]
        @cafe.parking = params[:parking]
        @cafe.americano_price = params[:americano_price]
        @cafe.dog_friendly = params[:dog_friendly]
        @cafe.outlets = params[:outlets]
        @cafe.rewiew = params[:review]
        @cafe.save
        redirect to "/cafes/#{@cafe.id}"
    end

    delete '/cafes/:id/delete' do
        @cafe = Cafe.find_by_id(params[:id])
        @cafe.delete
        redirect "/cafes"
      end
end