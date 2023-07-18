## HPC ##

#Submit a script called my_job.sh as a job (see link: https://docs.ycrc.yale.edu/clusters-at-yale/job-scheduling/#batch-jobs for details):
sbatch my_job.sh
#List your queued and running jobs:
squeue --me
#Cancel a queued job or kill a running job, e.g. a job with ID 12345:
scancel 12345
#Check status of a job, e.g. a job with ID 12345:
sacct -j 12345
#Check how efficiently a job ran, e.g. a job with ID 12345:
seff 12345

## To transfer file to HPC. Be on the local system and not logged in: ##

#Use scp (Secure Copy Protocol)
scp FILEwithPathLOCATION USERNAME@transfer-grace.hpc.yale.edu: LOCATIONONHPC
#note the \ between _ in names:
#e.g.:

/Users/username/projects/test\_project/test.csv USERNAME@transfer-grace.hpc.yale.edu:/home/username/project/test\_project/data

#To transfer a folder:
#You have to add -r after scp e,g,:

scp -r FILEwithPathLOCATION USERNAME@transfer-grace.hpc.yale.edu: LOCATIONONHPC

#Submit job can use the whole file path that links to .sh on HPC
sbatch  /home/username/project/test_project/analysis/src/hpc/run_test_code.sh
