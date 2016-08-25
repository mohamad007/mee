local function run(msg)
	local data = load_data(_config.moderation.data)
	if data[tostring(msg.to.id)]['settings']['lock_tags'] == 'yes' then
		if msg.to.type == 'channel' and not is_momod(msg) then
			delete_msg(msg.id,ok_cb,false)
		end
	end
end

return {
	patterns = {
	"#(.*)",
	"#"
	},
 	run = run
}

--By Cyber

