#To get data from movebank run:
#### Mosey Db
#1. get data from movebank clean and into database
#2. clean the data
#3. add the data to db
#4. validate

#### Create a new database ####
#Shell
#See wf_create_db.sh for example script.

#Set up the environment. 
#Set MOSEYDB_SRC to the location of the mosey_db source code

wd=/Users/laf72/projects/Protected-Area-Movement/processed_data
export MOSEYDB_SRC=/Users/laf72/projects/Protected-Area-Movement/analysis/src/poc

cd $wd

#this makes the directory data we dont need that:
#mkdir -p data 

#Create the database

cat $MOSEYDB_SRC/create_db.sql | sqlite3 mosey.db

#run in terminal:
#shell
wd=/Users/laf72/projects/Protected-Area-Movement
#Set MOSEYDB_SRC to the location of the working directory
export MOSEYDB_SRC=/Users/laf72/projects/Protected-Area-Movement
cd $wd
#the load_studies.sh will download, clean, import, validate
#download from movebank (get_study.R)
#clean data (clean_stduy.R)
#import data to the db created above (import_study.R)
#validate data that was imported to database (validate_import.R)
sh /Users/laf72/projects/Protected-Area-Movement/analysis/src/hpc/load_studies.sh

#Once you have the data in the db you can use gee_ingest.sh to:
#1. export csv want
#2. upload to GCS
#3. upload to GEE

chmod 744 /Users/laf72/projects/Protected-Area-Movement/analysis/src/hpc/gee_ingest.sh

wd=/Users/laf72/projects/Protected-Area-Movement
sesnm=six_spp_test 
geePtsP=projects/ee-lfouda-001/assets/pa-gee-anno
gcsURL=gs://mol-playground/leila/projects/six_study_data_to_GEE
db=/Users/laf72/projects/Protected-Area-Movement/processed_data/mosey.db
outP=/Users/laf72/projects/Protected-Area-Movement/processed_data/annotations/gcs_ingest

cd $wd

/Users/laf72/projects/Protected-Area-Movement/analysis/src/hpc/gee_ingest.sh $sesnm $geePtsP $gcsURL $db $outP

# THEN
#1. annotate data in GEE using gee_anno_updated
#gee_anno.r <dat> <out> [--groups=<groups>] [--npts=<npts>] [--seed=<seed>] 
#Parameters:
#  dat: folder containing feature collections to annotate
#  out: path to output directory and file on gcs. do not include file extension, url info or bucket

Rscript /Users/laf72/projects/Protected-Area-Movement/analysis/src/workflow/gee_anno_updated.R projects/ee-lfouda-001/assets/pa-gee-anno leila/projects/six_study_data_annotated

#Then import_anno.sh to get data from GCS to db
chmod 744 /Users/laf72/projects/Protected-Area-Movement/analysis/src/hpc/import_anno.sh

wd=/Users/laf72/projects/Protected-Area-Movement
gcsOutURL=gs://mol-playground/leila/projects/six_study_data_annotated
annoP=/Users/laf72/projects/Protected-Area-Movement/processed_data/annotations/gcs_annotated
db=$wd/processed_data/mosey.db

cd $wd

/Users/laf72/projects/Protected-Area-Movement/analysis/src/hpc/import_anno.sh $gcsOutURL $annoP $db

