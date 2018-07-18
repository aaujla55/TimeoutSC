-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main(Data)
   local Success, Value = pcall(net.http.post,{url='http://localhost:6544/mappings', live=true, timeout=1})
   if not Success then
      if Value:find('Operation timed out after') then
         -- Handle the standard error.
         net.http.respond{body="Caught the error"};
         return
      else
         net.http.respond{body="Did not catch the error."}
         return
      end
   end
   net.http.respond{body="Everything worked."}
end