-- I do not know what luarocks guys have in mind
-- If they depend on external commands, it seems
-- completely irrelevant to install packages to
-- replace those commands (as you need these freaking
-- commands anyways to install the first modules!!)
-- On top of that it breaks features. BOUH.
fs_use_modules = false

rocks_trees = {
   home..[[/.luarocks]],
   {root="/csproject/dygroup2/czeng/deepmind-atari/torch", bin_dir="/csproject/dygroup2/czeng/deepmind-atari/torch/bin", lib_dir="/csproject/dygroup2/czeng/deepmind-atari/torch/lib/lua/5.1", lua_dir="/csproject/dygroup2/czeng/deepmind-atari/torch/share/lua/5.1"}
}

rocks_servers = {
   [[https://raw.githubusercontent.com/torch/rocks/master]],
   [[https://raw.githubusercontent.com/rocks-moonscript-org/moonrocks-mirror/master]]
}
