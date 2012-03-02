set :application, "chiscore"
set :repository,  "git@github.com:paulwpagel/chiscore.git"
set :scm, :git
set :deploy_to, "/home/chiscore/app"
set :user, "chiscore"
set :use_sudo, false

set :location, "chiscore.pratt.io"
role :web, location
role :app, location
role :db, location

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
