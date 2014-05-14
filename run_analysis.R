run_analysis <- function(debug=FALSE) {
        # constants
        source_dir <- "UCI HAR Dataset/"
        
        train_file_main <- "train/X_train.txt"
        train_file_subj <- "train/subject_train.txt"
        train_file_activity <- "train/y_train.txt"
        
        test_file_main <- "test/X_test.txt"
        test_file_subj <- "test/subject_test.txt"
        test_file_activity <- "test/y_test.txt"

        # check to see if UCI HAR Dataset already existed
        if(!file.exists(source_dir)){
                return("Error: unable to find source directory.")
        }
        # read the testing datasets
        test_data_main <- read.table(paste(source_dir, test_file_main, sep=""))
        test_data_subj <- read.table(paste(source_dir, test_file_subj, sep=""))
        test_data_activity <- read.table(paste(source_dir, test_file_activity, sep=""))
        # combin all testing datasets into one data table
        test_data <- cbind(test_data_subj, test_data_activity, test_data_main)
        if(debug){
                print(dim(test_data))
        }
        # read the training datasets
        train_data_main <- read.table(paste(source_dir, train_file_main, sep=""))
        train_data_subj <- read.table(paste(source_dir, train_file_subj, sep=""))
        train_data_activity <- read.table(paste(source_dir, train_file_activity, sep=""))
        # combine all training datasets into one data table
        train_data <- cbind(train_data_subj, train_data_activity, train_data_main)        
        if(debug){
                print(dim(train_data))
        }
        # merge train and test dataset
        master <- rbind(train_data, test_data)
        if(debug){
                print(dim(master))        
        }
        
        # rename column names
        colnames(master) <- generate_colnames()
        
        # subset the master dataset with columns associated with mean() and std() only
        master <- master[,include_columns(generate_colnames())]
        
        # rename column names and remove underscores
        colnames(master) <- gsub("_","",colnames(master))
        # label activity column
        mylabels <- get_activity_labels()
        master$activity <- sapply(master$activity, function(x){x<-mylabels[x]})
        
        # calculate the average for each the column in the subset per subject per activity, and save it in a file
        output <- aggregate(master[,-(1:2)], list(subject = master$subject, activity = master$activity), mean)
        write.csv(output, "output.csv", row.names=F)
}

generate_colnames <- function(){
        # constants
        source_dir <- "UCI HAR Dataset/"
        features_file <- "features.txt"
        
        # manipulate features.txt file content to generate the colnames
        data <- read.table(paste(source_dir, features_file, sep=""))[,2]
        
        # lowercase the list from features.txt
        data <- lapply(data, tolower)
        # replace - or , with _
        data <- lapply(data, function(x){gsub("-|,", "_", x)})
        # remove ()
        data <- lapply(data, function(x){gsub("\\(\\)", "", x)})
        # replace ( with _, remove )
        data <- lapply(data, function(x){gsub("\\(", "_", x)})
        data <- lapply(data, function(x){gsub("\\)", "", x)})
        
        
        data <- c("subject", "activity", data)
        data
}

get_activity_labels <- function(){
        # constants
        source_dir <- "UCI HAR Dataset/"
        labels_file <- "activity_labels.txt"
        data <- read.table(paste(source_dir, labels_file, sep=""))[,2]
        data                
}
include_columns <- function(mylist){
        # always include subject and activity
        myindexes <- c(1,2)
        result <- lapply(mylist, function(x){grepl("_mean|_std",x)})       
        for (i in 1:length(result)){
                if(result[i] == T){
                        myindexes <- c(myindexes, i)
                }        
        }
        myindexes
}
run_analysis(debug=F)