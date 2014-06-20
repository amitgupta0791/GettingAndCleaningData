getTidyFile <- function()

{
  ##Read Test data
    test <- read.table("X_test.txt")

  ##Read activity labels for each row
    test_ac <- read.table("Y_test.txt")

  ## Get the description of activities
    act_desc<-getActivity(test_ac)

  ##Read subjects data 
    test_sub <- read.table("subject_test.txt")

  ##Merge Activity level with the test data as a column
    test1 <- cbind(test_ac, act_desc, test) 

  ##Merge Subject Level with the test data as a column
    test2 <- cbind(test_sub, test1)

  ##Repeat the same for Training Data
    train <- read.table("X_train.txt")
    train_ac <- read.table("Y_train.txt")
    act_desc<-getActivity(train_ac)
    train_sub <- read.table("subject_train.txt")

  ##Merge Activity level with the train data as a column
    train1 <- cbind(train_ac,act_desc, train)
 
  ##Merge Subject Level with the train data as a column
    train2 <- cbind(train_sub, train1)

  ##Now Combine test2 and train2 into all 
    all <-rbind(train2, test2)

  ##Add Header to the all.
  ##Read the header file 
    colhead <- read.table("features.txt")

  ## take headings into a vector
    q<-c(t(colhead[2]))
    q <- c("subject", "activity", "activity_desc", q)
    names(all) <-q

  ## Get the indices that have name mean or std
    indices <- grep("mean\\(\\)|std\\(\\)", names(all))

  ## subset all with only these columns
    all1 <-all[,c(1,3,indices)]

  ## melt and cast the data set to summarize by subject and activity_desc
    library(reshape2)
    all1.m <-melt(all1, id=c(1:2), measure=c(3:68))
    all1.c <-dcast(all1.m, subject+activity_desc~variable, mean)

  ## write out the CSV file
    write.csv(all1.c, "tidyfile.csv")
}


getActivity <- function(ds) 
{
  act = c()
  for (i in seq( 1: nrow(ds))) 
    {
        if  (ds$V1[i] == 1) { act = c(act, "WALKING")}
   else if  (ds$V1[i] == 2) { act = c(act, "WALKING_UPSTAIRS")}
   else if  (ds$V1[i] == 3) { act = c(act, "WALKING_DOWNSTAIRS")}
   else if  (ds$V1[i] == 4) { act = c(act, "SITTING")}
   else if  (ds$V1[i] == 5) { act = c(act, "STANDING")}
   else if  (ds$V1[i] == 6) { act = c(act, "LAYING")}
    }
act
}

