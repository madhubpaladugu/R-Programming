setwd("F:/Datasets/Coursera/R Programming/week2/")
pollutantmean <- function(directory,pollutant,id=1:332) {
    ### 'directory' is a character verctor of length 1 indicating 
    ### the location of csv files
    ### 'pollutant' is character vector of length 1 indicating
    ### the name of the pollutant for which we will calculate the
    ### mean; either "sulfate" or "nitrate".
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    ##set working directory
    if(grep("specdata",directory)==1) {
        directory <- ("./specdata/")
    }
    all_files <- as.character(list.files(directory))
    filepath <- paste(directory,all_files,sep="")
    mean_vector <- c()
    for(i in id) {
        curr_file <- read.csv(filepath[i],header=T,sep=",")
        head(curr_file)
        na_removed <- curr_file[!is.na(curr_file[,pollutant]),pollutant]
        mean_vector <- c(mean_vector,na_removed)
    }
    result <- mean(mean_vector)
    return(result)
}
