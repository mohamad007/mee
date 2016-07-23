local function run(msg)

    local data = load_data(_config.moderation.data)

    if data[tostring(msg.to.id)]['settings']['lock_username'] == 'yes' then


		if msg.to.type == 'channel' and not is_momod(msg) then
			if msg.text then
				if msg.text:match("@") then
					delete_msg(msg.id,ok_cb,false)
				end
			end
			if msg.media then
				if msg.media.title then
					if msg.media.title:match("@") then
						delete_msg(msg.id,ok_cb,false)
					end
				end
				if msg.media.description then
					if msg.media.description:match("@") then
						delete_msg(msg.id,ok_cb,false)
					end
				end
				if msg.media.caption then
					if msg.media.caption:match("@") then
						delete_msg(msg.id,ok_cb,false)
					end
				end
			end
			if msg.fwd_from.title then
				if msg.fwd_from.title:match("@") then
					delete_msg(msg.id,ok_cb,false)
				end
		    end
	  end
   end
end

return {patterns = {
    "@",
	"%[(photo)%]",
	"%[(document)%]",
	"%[(video)%]",
	"%[(audio)%]"
}, run = run}

--By Cyber