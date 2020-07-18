# BTP
SVM based Vertical Handovers

In the given R script a total of one lakh observations were taken for sample set construction and building our SVM based classifier. So we have to determine the state of the access network with given input blockage occurence rate(lambda), blockage occupation rate(miu) and the transmission rate of lifi at that point. 
For simplicity and to maintain practicality we took lambda between 1 and 10, miu between 0 and 1, and transmission rate of lifi were taken between 2900 and 3200 mbps because LIFI transmission is approximately 100 times faster than wifi transmission(32 mbps), hence generalising it.A single
vertical handover overhead t is set to 500 ms, the time interval of a state T is set to 60 s and we have TH = t/T. Then after applying the formula to find states, we were able to get the state type for each data point. Now coming over to model creation we used SVM with polynomial kernel and did a grid search to determine
the best values of hyperparameters and the model gave an accuracy of 99% with less R squared difference in train and test dataset which makes our model robust to any overfitting.
