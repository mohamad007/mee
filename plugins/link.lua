do

function run(msg, matches)
    if is_sudo(msg) then
		local data = load_data(_config.moderation.data)
		local text1 = matches[2]
		local group_link = data[tostring(text1)]['settings']['set_link']
		if not group_link then 
			return "You must first create a new link or setlink"
		end
        local text = "Group link:\n"..group_link
        return text
	end
end

return {
  patterns = {
    "^[/#!]([Ll]ink) (%d+)$"
  },
  run = run
}

end