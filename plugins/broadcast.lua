local function run(msg, matches)
	if matches[1] == 'bc' then
		if is_admin1(msg) then
			local response = matches[3]
			--send_large_msg("chat#id"..matches[2], response)
			send_large_msg("channel#id"..matches[2], response)
			return "sent"
		else
			return "Only sudo and admins"
		end
	end
	if matches[1] == 'broadcast' then
		if is_admin1(msg) then -- Only sudo and admins !
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local chat = 'chat#id'..chat_id
				local channel = 'channel#id'..chat_id
				send_large_msg(chat, response)
				send_large_msg(channel, response)
			end
			return "sent"
		else
			return "Only sudo and admins"
		end
	end
end
return {
  patterns = {
    "^[#!/](broadcast) +(.+)$",
    "^[#!/](bc) (%d+) (.*)$"
  },
  run = run
}
