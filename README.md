# moving-object-detection
master thesis code

## Main Work
### 1.	Dataset (Video)  

#### a.	Horizontal (Landscape)  

‘ALOri.mp4’---- Reference Video  
  
  
‘BLOri.mp4’---- Test Video  

#### b.	Vertical (Portrait)  

‘APOri.mp4’---- Reference Video  
  
  
‘BPOri.mp4’---- Test Video  


### 2.	Calibration and Image Comparison  

#### a.	Horizontal (Landscape)  

‘Landscapebus.m’
#### b.	Vertical (Portrait)  

‘Portraitbus.m’  

After this step, the differences between reference and test videos are saved as (to speed up following calculation):  
  
  
‘dist.mat’ (Horizontal)  

‘dist1.mat’ (Vertical)

### 3.	Ground Truth  

‘GroundTruth.m’  

The ground truth are save as ‘GroundtruthL.mat’, ‘GroundtruthP.mat’

 

### 4.	Sampler  

‘maxSampler100.m’, ‘maxSampler500.m’, ‘maxSampler700L.m’

### 5.	Threshold  

‘ThresholdLand.m’  

‘ThresholdPor.m’

### 6.	Logistic Regression  

‘LogisticRegression.m’  

Logistic Regression in selected dataset  

‘LRPeriods.m’  


### 7.	SVM  

‘svm.m’

## Other Works:
### 1.	Preprocessing
### 2.	Sampler
### 3.	Digital
### 4.	Distance
### 5.	Number of Person  

  
  #### Dataset can be downloaded [here](http://pan.baidu.com/s/1dEDN6AP)
