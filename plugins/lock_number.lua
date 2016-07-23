local function run(msg)

    local data = load_data(_config.moderation.data)
	local number = msg.text:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local number2 = msg.media.title:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local number3 = msg.media.description:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local number4 = msg.media.caption:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local number5 = msg.fwd_from.title:match("[0123456789٠١٢٣٤٥٦٧٨٩]")

    if data[tostring(msg.to.id)]['settings']['lock_number'] == 'yes' then


		if msg.to.type == 'channel' and not is_momod(msg) then
			if msg.text then
				if number then
					delete_msg(msg.id,ok_cb,false)
				end
			elseif msg.media then
				if msg.media.title then
					if number2 then
						delete_msg(msg.id,ok_cb,false)
					end
				elseif msg.media.description then
					if number3 then
						delete_msg(msg.id,ok_cb,false)
					end
				elseif msg.media.caption then
					if number4 then
						delete_msg(msg.id,ok_cb,false)
					end
				else
					return ""
				end
			elseif msg.fwd_from then
				if msg.fwd_from.title then
					if number5 then
						delete_msg(msg.id,ok_cb,false)
					end
				end
			else
				return ""
			end
	  end
   end
end

return {patterns = {
    "[0123456789٠١٢٣٤٥٦٧٨٩]",
	"%[(photo)%]",
	"%[(document)%]",
	"%[(video)%]",
	"%[(audio)%]",
	"%[(unsupported)%]"
}, run = run}

--By Cyber