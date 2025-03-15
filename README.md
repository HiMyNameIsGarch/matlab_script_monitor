# Matlab Script Monitor
A Matlab script that monitors a temporary file for the full path to a MATLAB script. Designed for automation and integration with external tools.

## Usage
1. Start the pooling process by copying the contents of `beforemonitor.m` and pasting
in the MATLAB command window. Wait for process to start.

2. Once it is done you can open the editor and start writing your matlab script.

## How it works
The script monitors a temporary file for the full path to a MATLAB script. The
script is then executed and the temporary file is deleted. The script is
designed to be used with external tools that can write to the temporary file.

## Example
1. Start the pooling process
2. Write your Matlab script in some editor and save it as /your/path/to/script.m
3. Run `echo "/your/path/to/script.m" > /tmp/matlab_script_monitor`
4. The script will be executed and the temporary file will be deleted

## My integration with Neovim
I have integrated this script into Neovim with Socat.
My workflow is a bit different, I start the Socat server and then the pooling process.
Then I simply work on my script and when they are saved I get the output in Neovim.
More about the Neovim work can be found [here](https://github.com/HiMyNameIsGarch/dotfiles/blob/main/.config/nvim/lua/modules/nvim_socket_listener.lua).
