do

function run(msg, matches)
    if matches[1] == 'rem' and is_sudo(msg) and not matches[3] then
		local text = matches[2]
		print("SuperGroup "..msg.to.print_name.."("..text..") removed")
		superrem(msg)
		rem_mutes(text)
	end
end

return {
  patterns = {
    "^[/#!]([Rr]em) (%d+)$",
  },
  run = run
}

end