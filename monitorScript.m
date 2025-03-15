
% instead of the function disp, you can use the function fprintf to write the
% output to a file as I am using neovim, I can see the output directly in the
% terminal or pipe it in the notification center

function monitorScript(dataQueue)
    diary on;  % Enable logging
    disp('Monitoring script started. Waiting for changes in /tmp/matlab_live_script');

    % Path to the temporary file
    tempFile = '/tmp/matlab_live_script';

    while true
        % check if the file exists
        if exist(tempFile, 'file')
            % read the contents of the file
            try
                fileContents = fileread(tempFile);
                disp('File found. Reading the script path...');

                % remove any trailing whitespace
                scriptPath = strtrim(fileContents);

                % check existance
                if exist(scriptPath, 'file') == 2  % 2 means it's a file
                    disp(['Script found: ', scriptPath]);

                    % send the script path back to the main session with the dataqueue
                    send(dataQueue, scriptPath);
                    disp('Script path sent to main session.');

                    % delete the temporary file for the future uses
                    delete(tempFile);
                    disp('Temporary file deleted.');
                else
                    disp(['Script not found: ', scriptPath]);
                end
            catch ME
                disp('Error reading the file:');
                disp(ME.message);
            end
        end

        % frequency of checking the file
        pause(1);
        diary off; % Disable diary logging
    end
end
