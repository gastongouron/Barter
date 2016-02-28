every 1.minute do
   runner "ServiceUpdate.execute_service"
   command "echo 'one' && echo 'two'"
end