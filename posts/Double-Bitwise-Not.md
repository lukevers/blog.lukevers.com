---
Title: Double Bitwise Not
Description: ~~
Author: Luke Evers
Date: 2013-08-06 20:26
Lang: en
---

Earlier today I was deciding the best way to convert `true` to `1` in Javascript when I started to do some searching. It turns out that I found something that not only works faster than a lot of other functions, but also looks cool. 

```javascript
~~(true)   // returns 1
~~(false)  // returns 0
```
You can replace `(true)` or `(false)` with any variable that's a boolean and you'll get the same results. Another thing that I've found out, by using the same thing, is that it also takes the place of `Math.floor()`.

```javascript
~~3.1      // returns 3
~~-12.2    // returns -12
```

When compared to `Math.floor()`, most of the time the results show that the double bitwise not is better than `Math.floor()`, but it is browser dependant. To run the test on your browser, or just to view the results, check this [jsperf](http://jsperf.com/jsfvsbitnot) out.

Try it yourself!
