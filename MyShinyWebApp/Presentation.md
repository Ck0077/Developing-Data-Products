Prediction on MtCars Dataset
========================================================
author: ck
date: 19-March-2019
autosize: true

Content
========================================================

- Introduction
- Analysis
- Result

Introduction
========================================================

The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).

A Random Forest prediction model is generated with the goal to predict the fuel consumption based on the rest of the variables.


```r
library(datasets)
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

Analysis
========================================================


```r
library(caret)
library(randomForest)
customTrainControl <- trainControl(method = "cv", number = 10)
carsRandomForestModelBuilder <- function() {
  return(
    train(
      mpg ~ ., 
      data = mtcars,
      method = "rf",
      trControl = customTrainControl
    )
  )
}
```

Result
========================================================

```r
carsRandomForestModelBuilder()
```

```
Random Forest 

32 samples
10 predictors

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 28, 30, 28, 29, 30, 28, ... 
Resampling results across tuning parameters:

  mtry  RMSE      Rsquared   MAE     
   2    2.306022  0.9317742  2.098415
   6    2.254814  0.9261755  1.973501
  10    2.304513  0.9245316  1.979133

RMSE was used to select the optimal model using the smallest value.
The final value used for the model was mtry = 6.
```
