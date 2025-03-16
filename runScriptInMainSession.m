% this function is called in another script (monitorScript.m) that runs in the background
function runScriptInMainSession(scriptPath)
    % log the process
    my_disp('Data received in main session. Running script...', 1);
    my_disp(['Script path: ', scriptPath]);
    try
        % clear the workspace ( for small changes in the script )
        clear(scriptPath);
        % run the script
        scriptOutput = evalc(['run(''', scriptPath, ''')']);

        disp(scriptOutput);

        my_disp('Script output:', 1);
        my_disp(scriptOutput, 1);

        my_disp('Script executed successfully.');
        send_to_neovim('MATLAB: Script executed successfully.');
    catch ME
        my_disp('Error executing the script:', 1);
        my_disp(ME.message, 1);

        % log the error stack trace
        my_disp('Error stack trace:', 1);
        for k = 1:length(ME.stack)
            my_disp(sprintf('Error in %s (line %d)', ME.stack(k).name, ME.stack(k).line), 1);
        end
    end
end
