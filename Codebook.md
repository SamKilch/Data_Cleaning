## Codebook for Data processing

This is a description on how to execute the script and the different processing steps that are performed by the script. To execute, download the UCI HAR data and set the working directory as the main folder that contains all the files and folders. 

## Process steps undertaken by run_analysis.R

The script performes the following steps:
1. Load necessary libraries
2. Open the files and load the data (first the test, then the train)
    * Load data files
    * Load names
    * Load activities
    * Load subjects
3. Merge data sets together
    * merge data, names, activities and subject to one single dataframe
4. Label columns
5. Select the columns of interest (mean and standard values)
6. Put descriptive names for activities
7. Group and summarize data
    * Group data by subject and activity
    * Summarize the values for each subject and activity
8. Save data to file called (Tidy.txt)

## Variables used in the script

**features** contains the names of all the different measurements and **labels**
containes the labels for the activities. **data.test** contains the test data 
and **data.train** the train data. These two data sets are extended by the subject,
activity data, as well as a denominator for the set they come from. The two sets
are then merged together to the **data** dataframe. Finally, **Tidy** contains a
tidy data set with the mean of all the measurements for each subject and activity.