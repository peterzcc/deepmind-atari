#!/bin/sh

#$ -S /bin/bash

# specify where the output file should be put
#$ -o /project/dygroup2/czeng/deepmind-atari
# specify the working path
#$ -wd /project/dygroup2/czeng/deepmind-atari

# email me with this address...
#$ -M zccust@gmail.com
# email when the job starts (b) and after the job has been 
# completed (e)
#$ -m be

# my real program which should be run
. run_gpu breakout

