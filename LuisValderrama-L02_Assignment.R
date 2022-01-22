# Title: 'Lesson 2 Assignment: SQL & Data Wrangling'
# Author: "Luis Valderrama"
# Date: "1/12/2022"

## Lesson 2 Assignment Objective:
# Write a R query using sqldf package that does all the following:
  
# 1. JOIN the three assumed AdventureWorks2016CTP3 tables into 1 dataset. 
# The three data sets are presented in the form of .csv files and are named:
# Address, BusinessEntityAddress and Employee.

# 2. Filters the data for Job Titles that start with the word Research 

# 3. The resulting dataset should have these columns: BusinessEntityID, LoginID, JobTitle, City

## Step 1: Install Packages and Libraries 
install.packages("data.table")
install.packages("sqldf")
install.packages("curl")
library(data.table) # Loading `data.table` package
library(sqldf) # Loading `sqldf` package
library(curl) # Loading `curl` package
library(tidyverse) # Loading tidyverse

## Step 2: Data File Folder Location Setup 
folder_path = "C:/Users/lvald/OneDrive/Desktop/"

## Step 3: Read Data Files 
# Read .csv files
Employee = fread(paste(folder_path, "Employee.csv", sep = ""), header = TRUE)
BusinessEntityAddress = fread(paste(folder_path, "BusinessEntityAddress.csv", sep = ""), header = TRUE)
Address = fread(paste(folder_path, "Address.csv", sep = ""), header = TRUE)

# glimpse the data in the .csv files
Employee %>% glimpse()
BusinessEntityAddress %>% glimpse ()
Address %>% glimpse()

## Step 4: Joining Tables 
# Inner Join Employee and Business Entity Address using BusinessEntityID PK/FK
df_Employee_BusinessEntityAddress = merge(Employee, BusinessEntityAddress, by = c("BusinessEntityID"))

#Inner Join of the Address table to the newly created dataset for Employee and BusinessEntityAddress using AddressID as PK/FK
df_Employee_BusinessEntityAddress_Address = merge(df_Employee_BusinessEntityAddress
                                                  , Address, by = c("AddressID"))

# Glimpse the dataset
df_Employee_BusinessEntityAddress_Address %>% glimpse()

## Step 5: Select, Filter and Arrange

# In this step I take the new dataset and select the attributes requested on the assignment: BusinessEntityID, LoginID, JobTitle, City.
# Then, the attributes are filtered to only display employees whose job title, 'Research...'
# Then, the data is arranged by Job Title.

# The Final R&D Unit
df_RandD_Unit <- df_Employee_BusinessEntityAddress_Address %>% 
  select(BusinessEntityID, LoginID, JobTitle, City) %>% 
  filter(grepl('Research', JobTitle)) %>% 
  arrange(JobTitle)

# View the final results
df_RandD_Unit %>% head()

## Step 6: Write the Final Results to a .csv
write.csv(df_RandD_Unit, "R_and_D_Unit.csv", row.names = TRUE)
## END


























