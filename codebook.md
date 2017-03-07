Sourcing “run_analysis.R” creates a tidy data set “tidy_measurements.txt”. This data set contains the following factors and variables:


# Factors
subject:	participant ids
activity:	6 different activities performed by the participants                     
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING


# Variables 
Each variable contains numerical data. Here only mean and standard deviation were extracted from the original data.

Time.Body.Accelerometer.MEAN-X              
Time.Body.Accelerometer.MEAN-Y              
Time.Body.Accelerometer.MEAN-Z            
Time.Body.Accelerometer.SD-X              
Time.Body.Accelerometer.SD-Y              
Time.Body.Accelerometer.SD-Z                 
Time.Gravity.Accelerometer.MEAN-X           
Time.Gravity.Accelerometer.MEAN-Y          
Time.Gravity.Accelerometer.MEAN-Z          
Time.Gravity.Accelerometer.SD-X            
Time.Gravity.Accelerometer.SD-Y             
Time.Gravity.Accelerometer.SD-Z             
Time.Body.Accelerometer.Jerk.MEAN-X         
Time.Body.Accelerometer.Jerk.MEAN-Y           
Time.Body.Accelerometer.Jerk.MEAN-Z      
Time.Body.Accelerometer.Jerk.SD-X           
Time.Body.Accelerometer.Jerk.SD-Y         
Time.Body.Accelerometer.Jerk.SD-Z           
Time.Body.Gyroscope.MEAN-X                 
Time.Body.Gyroscope.MEAN-Y                 
Time.Body.Gyroscope.MEAN-Z                 
Time.Body.Gyroscope.SD-X                    
Time.Body.Gyroscope.SD-Y                   
Time.Body.Gyroscope.SD-Z                     
Time.Body.Gyroscope.Jerk.MEAN-X             
Time.Body.Gyroscope.Jerk.MEAN-Y            
Time.Body.Gyroscope.Jerk.MEAN-Z            
Time.Body.Gyroscope.Jerk.SD-X                
Time.Body.Gyroscope.Jerk.SD-Y              
Time.Body.Gyroscope.Jerk.SD-Z               
Time.Body.Accelerometer.Magnitude.MEAN       
Time.Body.Accelerometer.Magnitude.SD        
Time.Gravity.Accelerometer.Magnitude.MEAN   
Time.Gravity.Accelerometer.Magnitude.SD    
Time.Body.Accelerometer.Jerk.Magnitude.MEAN 
Time.Body.Accelerometer.Jerk.Magnitude.SD   
Time.Body.Gyroscope.Magnitude.MEAN          
Time.Body.Gyroscope.Magnitude.SD            
Time.Body.Gyroscope.Jerk.Magnitude.MEAN     
Time.Body.Gyroscope.Jerk.Magnitude.SD      
FRQ.Body.Accelerometer.MEAN-X              
FRQ.Body.Accelerometer.MEAN-Y              
FRQ.Body.Accelerometer.MEAN-Z              
FRQ.Body.Accelerometer.SD-X                  
FRQ.Body.Accelerometer.SD-Y                
FRQ.Body.Accelerometer.SD-Z                  
FRQ.Body.Accelerometer.Jerk.MEAN-X          
FRQ.Body.Accelerometer.Jerk.MEAN-Y          
FRQ.Body.Accelerometer.Jerk.MEAN-Z          
FRQ.Body.Accelerometer.Jerk.SD-X            
FRQ.Body.Accelerometer.Jerk.SD-Y            
FRQ.Body.Accelerometer.Jerk.SD-Z            
FRQ.Body.Gyroscope.MEAN-X                    
FRQ.Body.Gyroscope.MEAN-Y                   
FRQ.Body.Gyroscope.MEAN-Z                 
FRQ.Body.Gyroscope.SD-X                   
FRQ.Body.Gyroscope.SD-Y                     
FRQ.Body.Gyroscope.SD-Z                    
FRQ.Body.Accelerometer.Magnitude.MEAN       
FRQ.Body.Accelerometer.Magnitude.SD         
FRQ.Body..Accelerometer.Jerk.Magnitude.MEAN  
FRQ.Body..Accelerometer.Jerk.Magnitude.SD    
FRQ.Body..Gyroscope.Magnitude.MEAN          
FRQ.Body..Gyroscope.Magnitude.SD          
FRQ.Body..Gyroscope.Jerk.Magnitude.MEAN     
FRQ.Body..Gyroscope.Jerk.Magnitude.SD       

# Processing
The raw data will be edited in 6 steps: 

1. DOWNLOADING
A Zip-file containing the raw UCI data will be downloaded and extracted.

2. READING
With read.table() the data will be loaded into R.

3. MERGING TRAINING AND TEST SET
Training and test set will be merged into one data set


4. EXTRACTING MEAN AND STANDARD DEVIATION
A logical vector with the desired and unwanted strings will be created with grepl().
This vector will be used to select the desired subset of data, containing mean and standard deviation.

5. DESCRIPTIVE NAMES FOR ACTIVITIES AND LABELS
Using the library(qdap), the names will be adjusted for better readability.

6. TIDYING THE DATA
The library(reshape2) helps to melt() the data and to dcast() the molten data. By doing that we finally get our tidy data “m_data_cl”, which we save with write.table() as “tidy_measurements.txt”.
