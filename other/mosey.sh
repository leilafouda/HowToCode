# For code used with https://github.com/benscarlson/mosey #

#First up: https://github.com/benscarlson/mosey_db
#### Create a new database ####

##Set up the environment.##

#Need to set MOSEYDB_SRC to the location of the mosey_db source code

#Set working directory
wd=/Users/laf72/projects/Protected-Area-Movement/processed_data
export MOSEYDB_SRC=/Users/laf72/projects/Protected-Area-Movement/analysis/src/poc

cd $wd

#this makes the directory 'data' we don't need that:
#mkdir -p data 

#Create the database - only do this if it does not exist

cat $MOSEYDB_SRC/create_db.sql | sqlite3 mosey.db

#To run the whole load_studies.sh script:

#set wd
wd=/Users/laf72/projects/Protected-Area-Movement

#Set MOSEYDB_SRC to the location of the working directory
export MOSEYDB_SRC=/Users/laf72/projects/Protected-Area-Movement

cd $wd
sh /Users/laf72/projects/Protected-Area-Movement/analysis/src/hpc/load_studies.sh
