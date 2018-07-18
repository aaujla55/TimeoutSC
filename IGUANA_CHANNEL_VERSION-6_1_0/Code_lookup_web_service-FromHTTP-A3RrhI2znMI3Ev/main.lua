-- ## Add required modules needed to support interface
local mapDB = require 'demo.lookups.db.procedures'


-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main(Data)

   -- ## Initiate database
  -- local conn = mapDB.init()
  -- trace(conn:check())
   
   -- ## Log request so it shows up in Iguana logs
   --    to aid in troubleshooting.
   iguana.logInfo(Data)
   
   -- ## Parse request
   -- Get method, uri, body
   local R = net.http.parseRequest{data=Data}
   
   if not iguana.isTest() then
      util.sleep(3000) -- sleep for 3 secs
   end
   
   net.http.respond{body='OK',
      headers=headers,
      entity_type='application/json',
      code=status}
   
   
end