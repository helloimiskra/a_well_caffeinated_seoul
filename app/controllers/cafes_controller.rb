class CafesController < ApplicationController

    get '/cafes' do
        redirect_if_not_logged_in
        @cafes = current_user.cafes
        erb :'cafes/index'
    end


    get '/cafes/new' do
        redirect_if_not_logged_in
        erb :'cafes/new'
    end

    post '/cafes' do
        redirect_if_not_logged_in
        @cafe = Cafe.create(params)
        @cafe.user = current_user
        @cafe.save
        redirect to "/cafes/#{@cafe.id}"
    end

    get '/cafes/:id' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])

        own_cafe?(@cafe)
        erb :'cafes/show'
    end

    get '/cafes/:id/edit' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])

        own_cafe?(@cafe)
        erb :'cafes/edit'
    end

    patch '/cafes/:id' do
        redirect_if_not_logged_in
        @cafe = Cafe.find_by_id(params[:id])
        own_cafe?(@cafe)
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
        own_cafe?(@cafe)
        if @cafe
            @cafe.delete
            redirect to '/cafes'
        end
    end

    post '/cafes/search' do
        @cafes = Cafe.where("name LIKE ?", "%#{params[:search]}%").where(user: current_user)
        erb :'/cafes/index'
    end

end