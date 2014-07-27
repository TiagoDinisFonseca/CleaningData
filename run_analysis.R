# Please read README.md file to better understand this script

# This is the path for the data, correct it if needed
path <- ""

# Checking if the files are all into the right place
	if (file.exists(paste0(path, "activity_labels.txt")) &&
		file.exists(paste0(path, "test/subject_test.txt")) &&
		file.exists(paste0(path, "train/subject_train.txt")) &&
		file.exists(paste0(path, "test/y_test.txt")) &&
		file.exists(paste0(path, "train/y_train.txt")) &&
		file.exists(paste0(path, "features.txt")) &&
		file.exists(paste0(path, "train/X_train.txt")) &&
		file.exists(paste0(path, "test/X_test.txt"))) {

	# Reading the activity labels, in order to get human readible labels for the activities
	read.table(paste0(path, "activity_labels.txt"), col.names = c("activity", "activity_name")) -> labels

	# Reading the subjects indications for both test and train measurements
	read.table(paste0(path, "test/subject_test.txt"), col.names = "subject") -> test_subjects
	read.table(paste0(path, "train/subject_train.txt"), col.names = "subject") -> train_subjects

	# Reading the activities indications for both test and train measurements
	read.table(paste0(path, "test/y_test.txt"), col.names = "activity") -> test_labels
	read.table(paste0(path, "train/y_train.txt"), col.names = "activity") -> train_labels

	# Reading the features file, in order to get human readible labels for the values
	read.table(paste0(path, "features.txt"), as.is = T) -> features

	# Processing names, removing () and writing them in a vector
	features[,2] -> ColumnNames
	gsub("()","",ColumnNames, fixed = T) -> ColumnNames

	# Reading data for both train and test measurements
	read.table(paste0(path, "train/X_train.txt"), col.names = ColumnNames) -> train_data
	read.table(paste0(path, "test/X_test.txt"), col.names = ColumnNames) -> test_data

	# Selecting all mean and std columns (several options, please comment all but one)
		# 1: all columns with mean or std on the name
		#c(grep("[mM]ean", ColumnNames), grep("std", ColumnNames)) -> columns

		# 2: all columns with mean or std on the name, excluding meanFreq
		c(grep("mean", ColumnNames), grep("std", ColumnNames)) -> columns
		grep("meanF", ColumnNames) -> columnsToRemove
		columns[!(columns %in% columnsToRemove)] -> columns


		# 3: the main measurements with mean and std on the name
		#c(1:6, 41:46, 121:126) -> columns

	# Binding together train and test data
	rbind(train_data[, columns], test_data[, columns]) -> data
	rbind(train_subjects, test_subjects) -> data_subjects
	rbind(train_labels, test_labels) -> data_labels

	# Binding together subjects with activity labels
	cbind(data_subjects, data_labels) -> filter

	# Doing the average by subject and activity
	aggregate(data, filter, mean) -> tidy_data

	# Replacing the activity by activity name
	data.frame(merge(labels, tidy_data)) -> tidy_data
	tidy_data[,!(colnames(tidy_data) %in% c("activity"))] -> tidy_data

	# Writing the data in a new file tidy_data.txt
	write.table(tidy_data, "tidy_data.txt", sep = "\t", row.names = F)
	message("The file \"tidy_data.txt\" was created.")
} else {
message("We could not find the data, please read README.md") 
}
