-- function for AOS-CLI to pretty print the messages in the inbox
local inbox -- just to avoid linter warning
function CheckInbox() local o = ''; for i,m in ipairs(inbox) do for i,t in ipairs(m.tags) do if t.name == 'body' then o = o .. t.value .. '\n---\n' end end end; return o end