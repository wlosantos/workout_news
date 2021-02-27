Friend.list_friends_requested(1).each do |friend|
  puts friend.requested_by.name
end
