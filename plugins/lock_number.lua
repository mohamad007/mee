local function run(msg)
	local data = load_data(_config.moderation.data)
	if data[tostring(msg.to.id)]['settings']['lock_number'] == 'yes' then
		if msg.text and not is_momod(msg) then
			if msg.text:match("[0123456789]") then
				delete_msg(msg.id,ok_cb,false)
			end
		end
		if msg.media and not is_momod(msg) then
			if msg.media.caption then
				if msg.media.caption:match("[0123456789]") then
					delete_msg(msg.id,ok_cb,false)
				end
			end
		end
		if msg.fwd_from and not is_momod(msg) then
			if msg.fwd_from.title then
				if msg.fwd_from.title:match("[0123456789]") then
					delete_msg(msg.id,ok_cb,false)
				end
			end
		end
	end
end

return {
	patterns = {
	"*",
	"$",
	"[0123456789]",
	"(.*)"
	},
 	run = run
}

--By Cyber

