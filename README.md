# Confidence Interval Matlab

## Running the code

The codes can be found in the `project_codes` directory. Set this directory as
the current working directory before running the code.

### Running the tests for all 10 functions

```matlab
>>> test_ci(1:10)
```

### Running the test for any specific function or set of functions

```matlab
% Test For function 2
>>> test_ci(2) 
% Test For function 3, 6 and 7
>>> test_ci([3 6 7]) 
```

### Optional parameters

Optional parameters for testing like values of data-sizes `Ns` and confidence levels 
`alphas` can be passed as lists.

Example:

```matlab
>>> test_ci(1:10, 'Ns', [10 100 1000], 'alphas', [0.25 0.1 0.05])
```

The default values used are:

```matlab
Ns = [10 100 1000 10000]
alphas = [0.25 0.1 0.05 0.01]
```

## Report and Slides

The report and slides can be found in the `docs/` directory.

## Input data distribution

The input data distributions used are:

- Bernoulli distribution with theta = 0.5 (True mean = 0.5)
- Uniform distribution with a = 0, b = 1 (True mean = 0.5)
- Uniform distribution with a = 0, b = 0.05 (True mean = 0.025)
- Beta distribution with a = 1, b = 3 (True mean = 0.25)

The distribution parameters can be changed in the file `test_ci.m`
