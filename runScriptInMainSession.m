% this function is called in another script (monitorScript.m) that runs in the background
function runScriptInMainSession(scriptPath)
    % log the process
    my_disp('Data received in main session. Running script...', 1);
    my_disp(['Script path: ', scriptPath]);
    try
        % clear the workspace ( for small changes in the script )
        clear(scriptPath);
        % run the script
        run(scriptPath);
        my_disp('Script executed successfully.');
        send_to_neovim('MATLAB: Script executed successfully.');
    catch ME
        my_disp('Error executing the script:', 1);
        my_disp(ME.message);
    end
end

% in the future I may redirect the output to a file to get the text whereever u want
