#Once you have gustil installed you need to authorise to your GEE: 
gcloud auth login
#Also need to install earth engine API: 
pip install earthengine-api

#Code adapted from Ben Carlson and Diego Ellis Soto
#Run below to get data from my computer -> GCS -> GEE
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- #
# Upload data to google cloud storage and earth engine
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- #
csv=/Users/leila/projects/test-project/out/gee_test/testdata_copy.csv #location of csv to upload on computer

gcs_csv_path=gs://BUCKETNAME/leila/projects/test_data_GEE/ #location to send data to in bucket

#sends code to GCS
gsutil -q cp -r $csv $gcs_csv_path

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- #
# Sends code to GEE form GCS
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- #
gcsCSV=gs://BUCKETNAME/leila/projects/test_data_GEE/testdata_copy.csv

geePts=projects/gee-test-project/assets/gee-test-project-folder/testdata_copy

#sends code to earth engine
earthengine upload table $gcsCSV --asset_id $geePts --x_column lon --y_column lat --force

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- #
# Run gee_anno (adapted from Ben Carlson - https://github.com/benscarlson/mosey_env/blob/main/main/gee_anno.r)
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- #
#Then I ran gee_anno through the CL with:
#gee_anno.r <dat> <out> [--groups=<groups>] [--npts=<npts>] [--seed=<seed>] 

#Parameters:
# dat: folder containing feature collections to annotate - i.e. the GEE location of data 
# out: path to output directory and file on gcs. do not include file extension, url info or bucket i.e. the GCS bucket folder (not bucket name) to send data to
  
Rscript ~/projects/Ptest-project/analysis/src/workflow/gee_anno_updated.R projects/gee-test-project/assets/gee-test-project-folder leila/projects/test_data_GEE 

# Make sure the path names are correct for entities and envs. If do not set the right directory ahead of time!




