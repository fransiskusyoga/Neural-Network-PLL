## Create dataset using C
Dataset need a huge amound of data. This folder contains the program to generate the dataset. It uses C languange so the calclation ccan be done quickly. However, it does not have multithreading feature. To run the program for multiple data you need to modify the c code, compile, and run in diffrent executable file.

### Output file
On the deefault setting it will create 2 files rise.csv and jitter.csv. The rise.csv contains the matrix of rising edge in diffrent simulation setting. The jitter.csv contains corresponding jitter value. Both csv-s is N row and M column. Data in same row have same Kp value and data in same column have same DCO noise level. You can scpecify the number of Kp variety and the number of DCO range you wanna use. 