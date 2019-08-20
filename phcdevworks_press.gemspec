$:.push File.expand_path("lib", __dir__)
require "phcdevworks_press/version"

Gem::Specification.new do |spec|

  spec.name        = "phcdevworks_press"
  spec.version     = PhcdevworksPress::VERSION
  spec.authors     = ["PHCDevworks"]
  spec.email       = ["developers@phcdevworks.com"]
  spec.homepage    = "https://phcdevworks.com/"
  spec.summary     = "Rails 6 CMS Engine"
  spec.description = "Ruby on Rails 6 CMS engine to manage your Rails site's articles, categories and media."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #raise "RubyGems 2.0 or newer is required to protect against " \
  #"public gem pushes."
  #end
  
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # Main Dependencies
  spec.add_dependency "rails", "~> 6.0.0.rc2"
  spec.add_dependency "jbuilder", "~> 2.7"
  spec.add_dependency "paper_trail", "~> 10.3"
  spec.add_dependency "friendly_id", "~> 5.2"

  # Theme Dependencies
  spec.add_dependency "phcthemes_admin_panel_pack", "~> 0.31.0"
  spec.add_dependency "phcthemes_web_theme_pack", "~> 0.15.0"

  # Helper Dependencies
  # spec.add_dependency "phcdevworks_core", "~> 0.5.0"
  spec.add_dependency "phcdevworks_active_menus", "~> 0.33.0"
  spec.add_dependency "phcdevworks_notifications", "~> 0.35.0"
  spec.add_dependency "phcdevworks_titleseo", "~> 0.37.0"

  # Images & Service Support Dependencies
  spec.add_dependency "aws-sdk-s3", "~> 1.43"
  spec.add_dependency "google-cloud-storage", "~> 1.18"
  spec.add_dependency "mini_magick", "~> 4.9"

  # Security Dependencies
  spec.add_dependency "phcdevworks_accounts", "~> 0.8.0"

  # Development Dependencies
  spec.add_development_dependency "sqlite3", "~> 1.4", ">= 1.4.1"

end