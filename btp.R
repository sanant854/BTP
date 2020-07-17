

total<-100000
lambda<-runif(total,min=0,max=10)
miu<-runif(total,min=0,max=1)
r_wifi<-32
r_lifi<-runif(total,min=2900,max=3200)
t_h<-0.00833

data<-cbind(lambda,miu,r_lifi)
data<-as.data.frame(data)
k1<-r_wifi

k2<-(1-miu)*(r_lifi)
k3<-1:total
for(i in 1:total){
  k3[i]<-(max(miu[i]-(lambda[i]*t_h),0)*(r_wifi))+(max(1-miu[i]-(lambda[i]*t_h),0)*(r_lifi[i]))
}


state<-1:total

for(i in 1:total){
  if(k1>=k2[i] && k1>=k3[i])
  {
    state[i]=1
  }
  else if(k2[i]>=k1 && k2[i]>=k3[i])
  {
    state[i]=2
  }
  else if(k3[i]>=k1 && k3[i]>=k2[i])
  {
    state[i]=3
  }
    
}

data$state<-as.factor(state)

library(caret)

intrain<-createDataPartition(data$state,p=0.7,list=FALSE)
train<-data[intrain,]
test<-data[-intrain,]

library(e1071)
fit<-svm(state~.,data=train,kernel="polynomial",degree=2,gamma=1,cost=0.1,coef0=1)

pre<-predict(fit,test)

confusionMatrix(pre,test$state)




