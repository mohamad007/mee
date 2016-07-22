local function run(msg)

    local data = load_data(_config.moderation.data)

     if data[tostring(msg.to.id)]['settings']['lock_number'] == 'yes' then


if msg.to.type == 'channel' and not is_momod(msg) then
	if msg.text:match("[1234567890]") or msg.media.title:match("[1234567890]") or msg.media.description:match("[1234567890]") or msg.media.caption:match("[1234567890]") or msg.fwd_from.title:match("[1234567890]") then
		delete_msg(msg.id,ok_cb,false)

			return 
		 end
	  end
   end
end

return {patterns = {
      "$",
	  "%",
	  "*",
	  "[123456789]",
	  "%[(photo)%]",
	  "%[(document)%]",
	  "%[(video)%]",
	  "%[(audio)%]",
	  "%[(unsupported)%]"
}, run = run}

--By cyber
