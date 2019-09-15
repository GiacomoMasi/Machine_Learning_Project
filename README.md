# Machine_Learning_Project
Final project of the course Machine Learning

## Expectation Maximization Algorithm
In this repo there is the implementation of the EM Algorithm to perform classification and the estimation of the parameters of the model. The code is written in Matlab

## DataSets
The algorithm was tested over three different datasets:
  1) Synthetic dataset: dataset created by me containing four classes
  2) Iris dataset: dataset with 3 classes, taken from the UCI repository
  3) Seed dataset: dataset with 3 classes, taken from the UCI repository
  
```
Iris Dataset : https://archive.ics.uci.edu/ml/datasets/Iris
Seed Dataset: https://archive.ics.uci.edu/ml/datasets/seeds
```
### Run Project

## Run only EM algorithm

To run the simple EM algorithm on the synthetic dataset:
```
run main_synthetic_test.m
```
To run the simple EM algorithm on the Iris dataset:
```
run main_iris_test.m
```
To run the simple EM algorithm on seed dataset:
```
run main_seed_test.m
```

## Run EM algorithm with model selection with Bayesian Information Criterion

To run the EM algorithm with BIC on the synthetic dataset:
```
run main_synthetic.m
```
To run the EM algorithm with BIC on the Iris dataset:
```
run main_iris.m
```
To run the EM algorithm with BIC on the Seed dataset:
```
run main_seed.m
```
