local function run(msg)

    local data = load_data(_config.moderation.data)
	local is_number_msg = msg.text:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local is_number2_msg = msg.media.title:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local is_number3_msg = msg.media.description:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local is_number4_msg = msg.media.caption:match("[0123456789٠١٢٣٤٥٦٧٨٩]")
	local is_number5_msg = msg.fwd_from.title:match("[0123456789٠١٢٣٤٥٦٧٨٩]")

    if data[tostring(msg.to.id)]['settings']['lock_number'] == 'yes' then


		if msg.to.type == 'channel' and not is_momod(msg) then
			if msg.text then
				if is_number_msg then
					delete_msg(msg.id,ok_cb,false)
				end
			elseif msg.media then
				if msg.media.title then
					if is_number2_msg then
						delete_msg(msg.id,ok_cb,false)
					end
				end
				if msg.media.description then
					if is_number3_msg then
						delete_msg(msg.id,ok_cb,false)
					end
				end
				if msg.media.caption then
					if is_number4_msg then
						delete_msg(msg.id,ok_cb,false)
					end
				end
			elseif msg.fwd_from.title then
				if is_number5_msg then
					delete_msg(msg.id,ok_cb,false)
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
	"%[(unsupported)%]",
	"$",
	"*",
	"%"
}, run = run}

--By Cyber