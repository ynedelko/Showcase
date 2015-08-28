require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#homepage, shows all bands
get('/') do
  @bands = Band.all()
  erb(:index)
end

#adding a new band, added band shows up on homepage
post("/bands") do
  name = params.fetch("name")
  band = Band.new({:name => name})
  band.save()
  @bands = Band.all()
  erb(:index)
end

#going to a particular band detail page
get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_detail)
end

#deleting a band, then going back to the homepage
delete('/bands/:id/delete') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.destroy()
  redirect("/")
end
