Cronjobs.define do

  env 'PATH=$PATH:/usr/local/bin'
  mailto 'test@mail.com'
  output Rails.root.join('log/cronjobs.log')

  every '* 1 * * *' do
    runner 'Attachs.clear'
    rake 'certificates:check'
  end

end
