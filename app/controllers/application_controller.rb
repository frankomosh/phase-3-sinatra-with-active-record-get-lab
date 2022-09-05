class ApplicationController < Sinatra::Base

 set :default_content_type, 'application/json'
  # add routes

  # get '/bakeries' do
  #   Bakery.all.to_json
  # end
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    baker = Bakery.find(params[:id])
    baker.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    BakedGood.all.order(price: :desc).to_json
   
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order("price DESC").first.to_json
  end
end