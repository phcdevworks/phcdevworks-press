### Phcdevworks Press (News/Blog Engine) Documentation
Phcdevworks Press rails CMS engine to manage your website's articles, categories and media.

* Website article posts with WYSIWYG editor.
* Upload images locally or use any popular cloud service.
* Customizable article categories module included.

#### Step 1 - Add Phcdevworks Press to your gemfile  and run command  

	gem 'phcdevworks_press'
	bundle install

#### Step 2 - Copy Phcdevworks Press Database Tables  
To copy Phcdevworks Press' requried database migrations, copy each command individually to your terminal's command line.  

	rails phcdevworks_press:install:migrations
	rails db:migrate

#### Step 3 - Mount Phcdevworks Press & Add Routes
Mount Phcdevworks Press by adding code below to your routes file.  

	mount PhcdevworksPress::Engine, :at => '/'

#### Step 4 - Recompile Assets  
To properly function re-compile your application's assets to copy over required files.

	rails assets:clobber
	rails assets:precompile

#### Step 5 - Generate Contact Form View (Customization)  
All Phcdevworks Press views and layouts can be overwritten by copying files to your application.

	rails generate phcdevworks_press:views
	