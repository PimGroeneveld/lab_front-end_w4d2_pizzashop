require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/pizza_order")
also_reload("./models/*")

#RESTful routes
#get routes
#INDEX
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb (:index)
end

#NEW  --> more specific route goes above
get "/pizza-orders/new" do
  erb(:new)
end

#DELETE ALL
post "/pizza-orders/delete-all" do
  PizzaOrder.delete_all()
  erb(:delete_all)
end

#SHOW
get "/pizza-orders/:id" do
  @order = PizzaOrder.find(params[:id])
  erb (:show)
end

#post routes
#CREATE
post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

#DELETE
post "/pizza-orders/:id/delete" do
  @order = PizzaOrder.new(params)
  @order.delete
  # erb(:delete)
  redirect "/pizza-orders"
end

#EDIT
get "/pizza-orders/:id/edit" do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

#UPDATE
post "/pizza-orders/:id" do
  @order = PizzaOrder.new(params)
  @order.update
  erb(:update)
end

# link are only get, buttons can be post
