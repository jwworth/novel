"This task is called by the Heroku scheduler add-on"
task create_chapter: :environment do
  puts "Creating a chapter..."
  Chapter.create
  puts "done."
end
