

local function run(msg)
    
    local data = load_data(_config.moderation.data)
    
     if data[tostring(msg.to.id)]['settings']['lock_media'] == 'yes' then
      
    
if msg.to.type == 'channel' and not is_momod(msg) then
	delete_msg(msg.id,ok_cb,false)

        return 
	
      end
   end
end
    
return {
patterns = {
"%[(photo)%]",
"%[(document)%]",
"%[(video)%]",
"%[(audio)%]",
},
 run = run
}

--By cyber
