Warden::GitHub::Rails.setup do |config|
  config.add_scope :user,  :client_id     => '6847be25975b19dead6e',
                           :client_secret => 'e9edaed773d0f3ff41576420d7d4c71c7ee77a83',
                           :scope         => 'user'

  config.default_scope = :user
end