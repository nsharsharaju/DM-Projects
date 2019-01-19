library(rpart)
library(rpart.plot)
library(caret)
library(caTools)

n_data <- movie_metadata[1:500,c(3,4,5,6,8,9,29)]

train_rows = sample.split(n_data$class,SplitRatio = 0.7)

train = n_data[train_rows,]
test = n_data[!train_rows,]

ID3 <- rpart(class ~ .,train , parms = list("information")) #### train 

rpart.plot(ID3)

pred1 <- predict(ID3,test)

predicted_class <- ifelse(pred1 > 0.5,1,0)

confusionMatrix(test$class,predicted_class)