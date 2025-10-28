game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author'Bodo Scripts'
description 'Outfits System'
discord 'https://discord.com/invite/4XbzV6HJzn'
tebex 'https://bdo-scripts.tebex.io/category/2567903'
version '1.0.3'
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