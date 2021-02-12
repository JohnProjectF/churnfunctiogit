getwd()
setwd("/Users/johnott/R code/R")
library(data.table)
library(ISLR)
library(churnfunction)

data_customer <- fread("Data/data_customer.csv")
data_personal <- fread("Data/data_personal.csv")

merged_data <- merge(data_customer, data_personal, by ="CustomerId", all = TRUE)
merged_data[,Gender :=as.factor(Gender)]
merged_data[,Exited :=as.factor(Exited)]
