# This is the major function that does the heavy lifting
# The function takes in a filename variable and then:
#  - Strips out the name of the zip file from the URL
#  - Downloads the zip file using the correct mode (based on file extension)
#  - Checks to see if the data has been subsetted - if not, does so
#  - Writes the subsetted data out to file.

DownloadAndPrepareData <- function(filename) {
    # Download and upzip the data file
    ElecPowerConsumption <- filename
    
    # Grep out the filename - we'll use that again
    # This regex finds the string %2F and then starts capturing from that point. If if finds %2F in the string,
    # it restarts the capture from that point until the end of the line.
    ZipName <- str_match(ElecPowerConsumption, "\\%2F((?:(?!\\%2F).)*)$")[, 2]
    
    # Download the ZIP file and then unzip it
    fileDownloader(ElecPowerConsumption, ZipName)
    if (!file.exists(ZipName)){
        unzip(file.path("./data", ZipName), exdir = "./data")
    }
    
    # The unzipped file has a txt extension not a zip. Create a variable to reflect that.
    DataFile <- str_replace(ZipName, ".zip", ".txt")
    
    # Define the directories where the data is located.
    DataFileName <- file.path("./data", DataFile)
    
    # Check to see if the filtered data set has been created. If not, create it.
    
    if (!file.exists(file.path("./data", "FilteredData.txt"))) {
        # Read in the full data set
        FullDataSet <- read.csv(DataFileName, 
                                sep = ";",
                                header = TRUE,
                                colClasses = c("character", "character", rep("numeric", 7)),
                                na.strings = "?")
        
        # Now filter out the appropriate days
        FullDataSet <- FullDataSet[FullDataSet$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        FullDataSet$DateTime <- strptime(paste(FullDataSet$Date, FullDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
        
        write.table(FullDataSet, file.path("./data", "FilteredData.txt"), sep = ",", row.names = FALSE)
    }
}

ReadInFilteredData <- function() {
    read.table(file.path("./data", "FilteredData.txt"), 
               sep = ",", 
               header = TRUE,
               colClasses = c("character", "character", rep("numeric", 7), "POSIXct"))
    
}

# Create a helper function to download the files
# This function makes sure that:
#  a) the data directory exists
#  b) if the file already exists it isn't re-downloaded

fileDownloader <- function (url, fname, directory = "./data") {
    # check to see if the directory exists, if not, create it
    if(!file.exists(directory)) {
        message(paste("Creating directory:", directory))
        dir.create(directory)
    } else {
        message(paste(directory, "directory already exists..."))
    }
    
    #Create a full path to the file
    fullFileName <- file.path(directory, fname)

    # Determine the download method based on the file type
    # 1. Extract the file type from the fname parameter
    #    The str_match function returns an array based on the grep pattern used
    #    Since I have used backreferences - by using brackets "()" - the value
    #    that I need is in the second item "[, 2]". The full match, including the period,
    #    is in the first item "[, 1]"
    # 2. Compare the filename to known file types and set the download mode
    FileType <- str_match(fname, pattern = "\\.(.+)$")[, 2]
    BinaryFileTypes <- c("zip", "xlsx")
    DownloadMode <- ifelse(FileType %in% BinaryFileTypes, "wb", "auto")
    
    # Check if the file exists. If not, download it using the correct
    # download method
    if(!file.exists(fullFileName)) {
        message(paste("Downloading file", fname))
        download.file(url, fullFileName, mode = DownloadMode)
    } else {
        message("File already downloaded...")
    }
}

# Create a generic function to read in files
readInData <- function(fnFileName, ...) {
    read.table(fnFileName, header = FALSE, ...)
}

