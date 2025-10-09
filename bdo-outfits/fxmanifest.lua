game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author'Bodo Scripts'
version '1.0.2'
lua54 'yes'
  

client_scripts { 
  'client/*.lua',  
}

shared_scripts {
  'client/language.lua',
}

escrow_ignore {
  'client/language.lua',
}
  
dependencies { 
  'bdo-input', 
}