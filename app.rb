require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#homepage, shows all bands and venues
get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

#adds new band, added band shows up on homepage
post('/bands') do
  name = params.fetch("name")
  band = Band.new({:name => name})
  band.save()
  @bands = Band.all()
  redirect("/")
end

#adds venue, added venue shows up on homepage
post('/venues') do
  name = params.fetch("name")
  venue = Venue.new({:name => name})
  venue.save()
  @venues = Venue.all()
  redirect("/")
end

#going to a particular band detail page
get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_detail)
end

#updating a band, then staying on band detail page to see new name
patch('/bands/:id') do
  new_name = params.fetch("name")
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.update({:name => new_name})
  erb(:band_detail)
end

#deleting a band, then going back to the homepage
delete('/bands/:id') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.destroy()
  redirect("/")
end

#displays list of venues for a band
get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venue = venue.all()
  erb(:band_detail)
end

#adds new venue to a particular band
post('/bands/:id/new') do
  new_venue_name = params.fetch("name")
  band_id = params.fetch("id").to_i
  band = Band.find(band_id)
  new_venue = Venue.find_or_create_by({:name => new_venue_name.capitalize()})
    if
      band.venues().find_by({:name => new_venue_name})
    else
      band.venues.push(new_venue)
    end
  redirect back
end

#going to a specific venue detail page
get('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:venue_detail)
end

#deleting a venue, then going back to the homepage
delete('/venues/:id') do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @venue.destroy()
  redirect("/")
end
