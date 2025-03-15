% this function is used to display the message in the MATLAB Command Window
% and write the message to a log file ( used to send the output via a socket to
% Neovim)
function my_disp(msg, write_to_nvim)
    if nargin < 2
        write_to_nvim = 0;
    end

    disp(msg);

    if write_to_nvim == 0
        return;
    end
    send_to_neovim(msg)
end
