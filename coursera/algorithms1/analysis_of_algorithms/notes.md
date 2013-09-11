Key: Running time

First step: make some observations

3-sum problem: Given N distict integers, how many triples sum to exactly zero?

30 -40 -20 -10 40 0 10 5

4 triples.

30 -40 10
30 -20 -10
-40 40 0
-10 0 10

Deeply related in computational geometry.
Can use brute force to list all possibilities.

# Manual
Way to time it: clock -> Manual

N^3

# Mathematical Model
Ignore low order terms

1/6 N^3 + 20 N + 16 ~ 1/6 N^3

tech def: f(N) ~ g(N) means lim n-> inf f(N)/g(N) = 1


Estimate discrete sum (very useful!!!):

1 + 2 + .. + N replace sum with integral

int N, x = 1 x dx ~ 1/2 N^2


# Order of Growth
1 -> constant
log N, -> logarithmic
N,
N log N -> linearithmic
N^2
N^3
2^N  -> exponential

Binary search -> mathematical analysis: 1 + lg N

T(N) -> compares to binary search

T(N) <= T(N/2) + 1 for N > 1, with T(1) = 1

T(N) <= T(N/2) + 1
     <= T(N/4) + 1 + 1
     ...
     <= T(N/N) + 1 + 1 + 1 + ... + 1
     = 1 + lg N


For 3-sum: use sort.

Sort the list of data.

For each pair of numbers a[i] and a[j]

do binary search for -(a[i] + a[j])

    (-40, -20)   no 60

Order of growth is N^2 log N

Step 1: N^2 with insertion sort
Step 2: N^2 log N with binary search

# Theory of algorithms

Types of analyses:
- Best case - lower bound
- Worst case - upper bound
- Average case - cost for random input

Goal: establish difficulty of a problem

Approach: suppress details in analysis -> remove constant factor

Focus on worst case design

Goal: optiomal algorithm

Big theta notation: describe order of Growth
Big oh notation: upper bound
Big Omega: lower bound

1-sum problem = is there a zero in the array

brute force: look at every array entry O(N) <- upper bound
omega(N) <- lower bound

if lower and upper bound match, then brute force algorithm for 1-sum is optimal

if lower and upper bound match, then brute force algorithm for 1-sum is
optimal

3-sum: upper bound O(N^3) <- brute force

Running time for optimal -> O(N^2 log N)


lower bound: omega(N) > have to examine all N entries to solve 3-sum

is there an optimal algorithm for 3-sum? we don't know.


Start
- develop an algorithm
- prove a lower bound

Gap?
- lower the upper bound (discover a new algorithm)
- raise the lower bound (more difficult)

Common mistake: interpreting big-oh as an approximate model.
Focus on approximate models: use tilde-notation


# Memory
meh
