#Load required libraries
library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/C:/Users/LENOVO T46OS/Desktop/sdc-bgd-mcna-individual-level")
data <- read_excel("data.xlsx", sheet = "Dataset - Individual", 
                   col_types = c("text", "numeric", "numeric", 
                                 "numeric", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "text", "text", "numeric"))
#Select key variables                   
selectedKeyVars <- c('ind_age',	'ind_age_mo',	'ind_gender')

#select weights
#weightVars <- c('weights')

#Convert variables into factors
cols =  c('ind_age',	'ind_age_mo',	'ind_gender')

data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into a dataframe
subVars <- c(selectedKeyVars)
fileRes<-data[,subVars]
fileRes <- as.data.frame(fileRes)
objSDC <- createSdcObj(dat = fileRes, 
                       keyVars = selectedKeyVars
                       )

#print the risk
print(objSDC, "risk")
max(objSDC@risk$global[, "risk"])

#Generate an internal (extensive) report
report(objSDC, filename = "index",internal = T, verbose = TRUE) 


