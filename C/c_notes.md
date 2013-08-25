### -= origin
In C, originally it was:
```
c=-3;
```

This was bad because it could be confused with:
```
c= -3;
```

### define vs const
define has no type safety, whereas const has.
Be careful when using a #define with an int, #define will be unsigned int, and
as such, your variable will get promoted to unsigned int.

```
#define haa 5
int d;
d = -1;
```
d will be greater than haa since d will get promoted to unsigned int

### Macro functions
Macro functions work well except for method macros where one of the parameters
is: `a++`
