every (ENV['MINUTES'].try(:to_i) || 5).minutes do
  rake 'vote'
end
