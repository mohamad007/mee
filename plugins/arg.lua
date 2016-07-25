do

function run(msg, matches)
    if matches[1] == 'rem' and is_sudo(msg) and not matches[3] then
		local text = matches[2]
		print("SuperGroup "..msg.to.print_name.."("..text..") removed")
		superrem(msg)
		rem_mutes(text)
	end
	if matches[1] == 'add' and is_sudo(msg) and not matches[3] then
		local text1 = matches[2]
		return reply_msg(msg.id, 'SuperGroup is already added.', ok_cb, false)
		print("SuperGroup "..msg.to.print_name.."("..text1..") added")
		savelog(text1, name_log.." ["..msg.from.id.."] added SuperGroup")
		superadd(msg)
		set_mutes(text1)
		channel_set_admin(receiver, 'user#id'..msg.from.id, ok_cb, false)
	end
end

return {
  patterns = {
    "^[/#!]([Rr]em) (%d+)$",
	"^[/#!]([Aa]dd) (%d+)$"
  },
  run = run
}

end