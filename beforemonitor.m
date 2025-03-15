
% my script makes use of parfeval to run a monitoring script in the background
% the monitoring script is a separate function that runs in the background and
% checks the status of the main script

% !!!! Make sure you have installed the Parallel Computing Toolbox to run this
% script

% start a parallel pool (if not already started)
if isempty(gcp('nocreate'))
    parpool(1);
end

% create a DataQueue and set up the callback
% you need to pass the dataQueue to the monitoring script as an input argument
% so that the monitoring script can send data back to the main script
dataQueue = parallel.pool.DataQueue;
afterEach(dataQueue, @runScriptInMainSession);

% run the monitoring script in the background
f = parfeval(@monitorScript, 0, dataQueue);

% IMPORTANT: Do not call fetchOutputs on the future object f
% as it will block the main script and prevent it from running

% at the final of your working session you can cancel the future object as
% follows:

cancel(f);

% THIS IS NOT A SCRIPT, IT IS A FUNCTION TO CALL IN COMMAND WINDOW
