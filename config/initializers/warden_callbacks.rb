Warden::Manager.after_authentication do |user, auth, opts|
  if user.sign_in_count.zero?
    channel = Channel.find(1)
    user.channels << channel
  end
end
