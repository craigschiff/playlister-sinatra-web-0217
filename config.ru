require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
# use Rack::Flash
use GenreController
use SongController
use ArtistController
run ApplicationController
