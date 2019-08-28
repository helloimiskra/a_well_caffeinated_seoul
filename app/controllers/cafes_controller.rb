class CafesController < ApplicationController

    get '/cafes' do
        redirect_if_not_logged_in
        @user = current_user
        @cafes = Cafe.all
        erb :'cafes/all'
    end


    get '/cafes/new' do
        redirect_if_not_logged_in
        erb :'cafes/create_cafe'
    end

    post '/cafes' do
        redirect_if_not_logged_in
        @cafe = Cafe.create(params)
        @cafe.user_id = current_user.id
        @cafe.save
        redirect to "/cafes/#{@cafe.id}"
    end

    get '/cafes/:id' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])
        erb :'cafes/show_cafe'
    end

    get '/cafes/:id/edit' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])
        erb :'cafes/edit_cafe'
    end

    patch '/cafes/:id' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])
        @cafe.name = params[:name]
        @cafe.location = params[:location]
        @cafe.parking = params[:parking]
        @cafe.americano_price = params[:americano_price]
        @cafe.dog_friendly = params[:dog_friendly]
        @cafe.outlets = params[:outlets]
        @cafe.review = params[:review]
        @cafe.save
        redirect to "/cafes/#{@cafe.id}"
    end

    delete '/cafes/:id' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])
        @cafe.delete
        redirect to '/cafes'
      end
end