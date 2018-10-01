# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :deploy do
    sh "git push origin master"
    sh "git push heroku master"
    sh ""

end

task :default => ["deploy"]
