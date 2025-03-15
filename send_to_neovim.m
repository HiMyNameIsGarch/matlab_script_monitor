function send_to_neovim(msg)
    try
        system(['echo "', msg, '" | socat - TCP:localhost:12345']);
    catch ME
        my_dist(['Error sending message to Neovim: ', ME.message]);
    end
end
