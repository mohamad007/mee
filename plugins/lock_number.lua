local function run(msg)

    local data = load_data(_config.moderation.data)

    if data[tostring(msg.to.id)]['settings']['lock_number'] == 'yes' then


		if msg.to.type == 'channel' and not is_momod(msg) then
			if msg.text then
				if msg.text:match("[0123456789]") then
					delete_msg(msg.id,ok_cb,false)
				end
			elseif msg.media then
				if msg.media.title then
					if msg.media.title:match("[0123456789]") then
						delete_msg(msg.id,ok_cb,false)
					end
				end
				if msg.media.description then
					if msg.media.description:match("[0123456789]") then
						delete_msg(msg.id,ok_cb,false)
					end
				end
				if msg.media.caption then
					if msg.media.caption:match("[0123456789]") then
						delete_msg(msg.id,ok_cb,false)
					end
				end
			elseif msg.fwd_from.title then
				if msg.fwd_from.title:match("[0123456789]") then
					delete_msg(msg.id,ok_cb,false)
				end
			else
				return ""
		  end
	  end
   end
end

return {patterns = {
    "[0123456789]",
	"%[(photo)%]",
	"%[(document)%]",
	"%[(video)%]",
	"%[(audio)%]"
}, run = run}

--By Cyber