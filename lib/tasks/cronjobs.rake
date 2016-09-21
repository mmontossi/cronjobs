namespace :cronjobs do
  task check: :environment do
    Cronjobs.check
  end
end
