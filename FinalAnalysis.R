**Creating .CSV file for visualization in Tableau**

#load libraries 

library(tidyverse) #calculations
library(lubridate) #dates 
library(hms) #time
library(data.table) #exporting data frame

#load original .csv files, a years worth of data from November 2021 to October 2022

nov21_df <- read_csv("/kaggle/input/cyclisticdata01/November-2021.csv")
dec21_df <- read_csv("/kaggle/input/cyclisticdata01/December-2021.csv")
jan22_df <- read_csv("/kaggle/input/cyclisticdata01/January-2022.csv")
feb22_df <- read_csv("/kaggle/input/cyclisticdata01/February-2022.csv")
mar22_df <- read_csv("/kaggle/input/cyclisticdata01/March-2022.csv")
apr22_df <- read_csv("/kaggle/input/cyclisticdata01/April-2022.csv")
may22_df <- read_csv("/kaggle/input/cyclisticdata01/May-2022.csv")
jun22_df <- read_csv("/kaggle/input/cyclisticdata01/June-2022.csv")
jul22_df <- read_csv("/kaggle/input/cyclisticdata01/July-2022.csv")
aug22_df <- read_csv("/kaggle/input/cyclisticdata01/August-2022.csv")
sep22_df <- read_csv("/kaggle/input/cyclisticdata01/September-2022.csv")
oct22_df <- read_csv("/kaggle/input/cyclisticdata01/October-2022.csv")

#Merge all of the data frames into one year view

cyclistic_df <- rbind(nov21_df,dec21_df,jan22_df,feb22_df, mar22_df, apr22_df, may22_df, jun22_df, jul22_df, aug22_df, sep22_df, oct22_df)


#Remove individual month data frames to clear up space in the environment

remove(nov21_df, dec21_df, jan22_df, feb22_df, mar22_df, apr22_df, may22_df, jun22_df, jul22_df, aug22_df, sep22_df, oct22_df)
#create new data frame to contain new columns

cyclistic_data <- cyclistic_df
#calculate ride length by subtracting ended_at time from started_at time and converted it to minutes

cyclistic_data$ride_length <- difftime(cyclistic_df$ended_at, cyclistic_df$started_at, units = "mins")

#create columnds for: day of week, month, day, year, time, hour

cyclistic_data$date <- as.Date(cyclistic_data$started_at) #default format is yyyy-mm-dd, use start date
cyclistic_data$day_of_week <- wday(cyclistic_df$started_at) #calculate the day of the week 
cyclistic_data$day_of_week <- format(as.Date(cyclistic_data$date), "%A") #create column for day of week
cyclistic_data$month <- format(as.Date(cyclistic_data$date), "%m")#create column for month
cyclistic_data$day <- format(as.Date(cyclistic_data$date), "%d") #create column for day
cyclistic_data$year <- format(as.Date(cyclistic_data$date), "%Y") #create column for year
cyclistic_data$time <- format(as.Date(cyclistic_data$date), "%H:%M:%S") #format time as HH:MM:SS
cyclistic_data$time <- as_hms((cyclistic_df$started_at)) #create new column for time
cyclistic_data$hour <- hour(cyclistic_data$time) #create new column for hour

#create column for different seasons: Spring, Summer, Fall, Winter

cyclistic_data <-cyclistic_data %>% mutate(season = 
                                             case_when(month == "03" ~ "Spring",
                                                       month == "04" ~ "Spring",
                                                       month == "05" ~ "Spring",
                                                       month == "06"  ~ "Summer",
                                                       month == "07"  ~ "Summer",
                                                       month == "08"  ~ "Summer",
                                                       month == "09" ~ "Fall",
                                                       month == "10" ~ "Fall",
                                                       month == "11" ~ "Fall",
                                                       month == "12" ~ "Winter",
                                                       month == "01" ~ "Winter",
                                                       month == "02" ~ "Winter")
)
#create column for different time_of_day: Night, Morning, Afternoon, Evening

cyclistic_data <-cyclistic_data %>% mutate(time_of_day = 
                                             case_when(hour == "0" ~ "Night",
                                                       hour == "1" ~ "Night",
                                                       hour == "2" ~ "Night",
                                                       hour == "3" ~ "Night",
                                                       hour == "4" ~ "Night",
                                                       hour == "5" ~ "Night",
                                                       hour == "6" ~ "Morning",
                                                       hour == "7" ~ "Morning",
                                                       hour == "8" ~ "Morning",
                                                       hour == "9" ~ "Morning",
                                                       hour == "10" ~ "Morning",
                                                       hour == "11" ~ "Morning",
                                                       hour == "12" ~ "Afternoon",
                                                       hour == "13" ~ "Afternoon",
                                                       hour == "14" ~ "Afternoon",
                                                       hour == "15" ~ "Afternoon",
                                                       hour == "16" ~ "Afternoon",
                                                       hour == "17" ~ "Afternoon",
                                                       hour == "18" ~ "Evening",
                                                       hour == "19" ~ "Evening",
                                                       hour == "20" ~ "Evening",
                                                       hour == "21" ~ "Evening",
                                                       hour == "22" ~ "Evening",
                                                       hour == "23" ~ "Evening")
)


#clean the data

cyclistic_data <- na.omit(cyclistic_data) #remove rows with NA values
cyclistic_data <- distinct(cyclistic_data) #remove duplicate rows 
cyclistic_data <- cyclistic_data[!(cyclistic_data$ride_length <=0),] #remove where ride_length is 0 or negative
cyclistic_data <- cyclistic_data %>%  #remove columns not needed: ride_id, start_station_id, end_station_id, start_lat, start_long, end_lat, end_lng
  select(-c(ride_id, start_station_id, end_station_id,start_lat,start_lng,end_lat,end_lng))
  
  #view the final data

View(cyclistic_data)

#created a new dataframe to use in Tableau
cyclistic_tableau <- cyclistic_data

#clean the data
cyclistic_tableau <- cyclistic_tableau %>%  #remove columns not needed: start_station_name, end_station_name, time, started_at, ended_at
  select(-c(start_station_name, end_station_name, time, started_at, ended_at))

#download the new data as a .csv file
fwrite(cyclistic_tableau,"cyclistic_data.csv")
