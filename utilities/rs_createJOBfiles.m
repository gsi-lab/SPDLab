function rs_createJOBfiles(n_jobs)
    % Creates n_jobs sh-files for running parallel jobs in the cluster.
    % By Resul Al @DTU.
    
    if nargin<1, n_jobs=5; end
    
    for j=1:n_jobs
        scriptname = sprintf('rs_bjob%d.sh', j);
        fid = fopen(scriptname, 'wt');
        fprintf(fid, '#!/bin/sh\n');
        fprintf(fid, '# embedded options to bsub - start with #BSUB\n\n');

        fprintf(fid, '# - our name ---\n');
        fprintf(fid, sprintf('#BSUB -J bjob%d',j));

        fprintf(fid, '\n\n# -- choose queue --\n');
        fprintf(fid, '#BSUB -q hpc\n\n');

        fprintf(fid, '# -- specify that we need 2GB of memory per core/slot -- \n');
        fprintf(fid, '#BSUB -R "rusage[mem=2GB]"\n\n');

        fprintf(fid, '# -- Output File --\n');
        fprintf(fid, sprintf('#BSUB -o opart%d',j));

        fprintf(fid, '\n\n# -- Error File --\n');
        fprintf(fid, sprintf('#BSUB -e epart%d',j));

        fprintf(fid, '\n\n# -- estimated wall clock time (execution time): hh:mm -- \n');
        fprintf(fid, '#BSUB -W 60:00\n\n');

        fprintf(fid, '# -- Number of cores requested --\n');
        fprintf(fid, '#BSUB -n 24\n\n');

        fprintf(fid, '# -- Specify the distribution of the cores: on a single node --\n');
        fprintf(fid, '#BSUB -R "span[hosts=1]"\n\n');

        fprintf(fid, '# -- commands you want to execute -- \n');
        fprintf(fid, sprintf('matlab920 -nodisplay -r rs_mjob%d',j));
        fclose(fid);
    end
    createMfiles(n_jobs)
    create_sub_all(n_jobs)
end

% don't use a single file to submit all jobs. Matlab complains.
% function create_sub_all(n_jobs)
%     if nargin<1, n_jobs=5; end
%     fid = fopen('sub_all.sh', 'wt');
%     fprintf(fid, '#!/bin/sh\n'); 
%     for j=1:n_jobs
%         fprintf(fid, sprintf('bsub<rs_bjob%d.sh\n',j));
%     end
%     fclose(fid);
% end

function createMfiles(n_jobs)
    for j=1:n_jobs
        scriptname = sprintf('rs_mjob%d.m', j);
        fid = fopen(scriptname, 'wt');
        fprintf(fid, sprintf('rs_runpartn(%d)',j));
        fprintf(fid, '\nquit');
        fclose(fid);
    end   
end