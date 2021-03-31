APSK16.m, APSK32.m, BPSK.m, DPSK_pi.m, DPSK.m, FSK.m, OQPSK.m, PAM.m, PSK.m, QAM.m are functions used to generate raw signals with the specific modulation method.

Signal_Generation.m is used to generate ideal signals, the output is a struct saved in commdata.mat. Please rename the file and move it to the IdealSignal folder.

Expand.m expand the length of data from the IdealSignal folder to 20000. And let the signal pass AWGN channel and Rayleigh channel. The output will be a struct saved in DataSet folder.

TrainingAndTesting.m splits the data in DataSet into training set and test set. The output will be saved in TrainingSet and TestingSet respectively.

Reshape.m is a function to reshape the signal to a 2*100*200*1 matrix for 3D input. 

Reshape2D.m is a function to reshape the signal to a 2*20000*1 matrix for 2D input. 

CNN_3D and CNN_2D are scripts to train 3DCNN and 2DCNN models, the training result will be saved in model.m file.

If the data loading time are too long in model training. You can use LoadData.m and LoadData_2D.m to pre-process the data first. Then train the model with the processed data in CNN_3D and CNN_2D. 

Prediction.m is the script to generate the predicted table.