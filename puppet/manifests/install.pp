#===========================================================
# make sure that this puppet script is run as sudo
if $id != "root" {
  fail("ERROR: you need to run this puppet script as 'root'. Use 'sudo' tool...")
} 
notice("SUCCESS: You runned tool as root")
