setwd("/home/pawel/git/neuralnet/src/NeuralNet/exercises/module6")
data<-read.table("hour.csv",header=T,sep=",")
head(data1)
nrow(data1)
data1<-data[,c("season","yr","mnth","hr","holiday","weekday","workingday","weathersit","temp","atemp","hum","windspeed","cnt")]
write.table(data1,"hour_aug.csv",sep=",",row.names=F,col.names=F)
