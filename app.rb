require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
@recipes = Recipe.all()
erb :index
end

get('/recipes/new') do
  erb :recipe_form
end

post('/recipes/new') do
  @recipes = Recipe.all()
  name = params[:name]
  ingredients = params[:ingredients]
  instructions = params[:instructions]
  Recipe.create({:name => name, :ingredients => ingredients, :instructions => instructions})
  redirect '/'
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb :recipe
end

patch('/recipes/:id/edit') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  name = params[:new_name]
  ingredients = params[:new_ingredients]
  instructions = params[:new_instructions]
  @recipe.update({:name => name, :ingredients => ingredients, :instructions => instructions})
  erb :recipe
end

delete('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  @recipe.destroy()
  redirect '/'
end
