# Dynamic Connectivity
Have 1 connected to 2, 4 connected to 5, 2 connected to 6.

Is 6 connected to 1? Yes

Is 4 connected to 2? No

{1, 2, 6}, {4, 5}

Union: If 2 connected to 6, then connect 1, 2, and 6


## Algorithms

### Quick find
This is an eager algorithm.

Data structure: integer array indexed by objects.

0

5  6



1  2
   7


3  4
8  9

       0   1   2   3   4   5   6   7   8   9
array: 0 | 1 | 1 | 8 | 8 | 0 | 0 | 1 | 8 | 8

Find: P and Q are connected in the entries in the array are the same.

Union: To merge components, change all entries whose id equals id[p] to id[q]



Initially
       0   1   2   3   4   5   6   7   8   9
array: 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

Union(4, 3):



       0   1   2   3   4   5   6   7   8   9
array: 0 | 1 | 2 | 3 | 3 | 5 | 6 | 7 | 8 | 9


Cost:

Initialization  -> N
Union           -> N
Find            -> 1

Take N^2 array accesses to proces sa sequence of N^2 union commands on N
objects.

QuickFind is too slow for huge problems.


### Quick Union
Lazy algorithm.

Integer array of size N
Interpretation: id[i] is the parent of i


       0   1   2   3   4   5   6   7   8   9
array: 0 | 1 | 9 | 4 | 9 | 6 | 6 | 7 | 8 | 9


0        1          9          6           7          8

                  2   4        5

                      3

Find: Check if p and q have the same root


Union: Set the id of p's root to the id of q's root:



0        1                     6           7          8

                           9      5

                         2  4

                            3

       0   1   2   3   4   5   6   7   8   9
array: 0 | 1 | 9 | 4 | 9 | 6 | 6 | 7 | 8 | 6
                                           |
                                           |
                                        changed

Costs:
Quick Union Find: N
Union: N
Init: N

Finds are expensive

### Improvements to Quick union

Weighted trees. When you perform unions, join the root of the smaller tree to
the root of the bigger tree.

Find is similar to Quick Union: make sure the roots are the same

Union: Link root of smaller tree to root of larger tree
Update the sz array

It's about size, not depth!

int i = root(p)
int j = root(q)

if (sz[i] < sz[j]) id[i] = j; sz[j] += sz[i]
else               id[j] = i; sz[i] += sz[j]

In first case, j is the root of i. As such, the size of the j tree will
increase.

Initially all values is sz is 0. sz measures the depth of the tree.


Find: takes proportinal time to depth of p and q

Union: takes constant time, given roots.

Depth of any node x is at most lg N, where lg is base of 2.

Proof: Depth of node x with tree T1 increases by 1 when it is merges with another
tree T2.

Size of tree containing x at least doubles since T2 >= T1
Size of tree containing x can double at most lg N times.

Notice it mentions size, not depth!


T2 (big)

      \

        T1(small)


So, everytime you do a union, the depth increases by 1, and the size at least doubles.

Since there are N nodes, then the maximum depth will be lg N.


Union: lg N
Find: lg N


Improvement2: Path compression to flatten the tree. Just after computing the
root of p, set the id of each examined node to point to that root.

So every node from p to the root will just change so that their parent is now
simply the root. This will flatten the tree.


### Applications
#### Percolation
If there is a path from top to bottom.

Each coordinate will just be assigned a number. All open spaces will be unioned
together.

Checking if top joins bottom by brute force will take N^2 time. Instead, create
a virtual tree on top, and a virtual tree on the bottom. Then see if top and
bottom trees are connected.

When you open a site, you connect it to adjacent open sites.
