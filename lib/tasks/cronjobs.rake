namespace :cronjobs do
  task update: :environment do
    Cronjobs.update
  end
end
