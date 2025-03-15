% this function is called in another script (monitorScript.m) that runs in the background
function runScriptInMainSession(scriptPath)
    % log the process
    disp('Data received in main session. Running script...');
    disp(['Script path: ', scriptPath]);
    try
        % clear the workspace ( for small changes in the script )
        clear(scriptPath);
        % run the script
        run(scriptPath);
        disp('Script executed successfully.');
    catch ME
        disp('Error executing the script:');
        disp(ME.message);
    end
end

% in the future I may redirect the output to a file to get the text whereever u want
