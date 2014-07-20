json.array! @posts do |post|
	json.id   post.id
  json.text post.text
  json.user post.user
end