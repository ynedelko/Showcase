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
