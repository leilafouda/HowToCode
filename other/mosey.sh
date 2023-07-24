# For code used with https://github.com/benscarlson/mosey #

#First up: https://github.com/benscarlson/mosey_db
#### Create a new database ####

#Set up the environment. 
#Set MOSEYDB_SRC to the location of the mosey_db source code

wd=/Users/laf72/projects/Protected-Area-Movement/processed_data
export MOSEYDB_SRC=/Users/laf72/projects/Protected-Area-Movement/analysis/src/poc

cd $wd

#this makes the directory data we dont need that:
#mkdir -p data 

#Create the database

cat $MOSEYDB_SRC/create_db.sql | sqlite3 mosey.db
