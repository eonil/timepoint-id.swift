EonilTimePoint
============

Globally ordered, infinite-spaced unique ID.

    let p1 = TimeLine.spawn()
    let p2 = TimeLine.spawn()
    XCTAssertLessThan(p1, p2) // `true`.

There are is two points of this library.

- **Globally ordered.**
- Infinite key resolution.
- Infinite key space.

As all instances of `TimePoint` are globally ordered by spawning time, they're always
stably sorted. This gives you so many usefulness. You can use this key for sorting.

Key resolution is infinite. Which means, whenever you make keys, regardless of how fast
you generate keys, your keys are guaranteed to be unique. This is not a time-stamp value.

Key space is infinite. Which means, you never run out of key space regardless of how many
times you create and destroy `TimePoint` instances. Of course, total number of instances
at a time is limited by your memory size. Though `Int64` space is very big, but still finite
space, and it's possible to consume all the key spaces eventually. `TimePoint` provide
infinite key space, and as long as you keep number of total keys in a certain limit,
you can create and destory your key infinite times.

Comparison with Other Solutions
---------------------------------------
Basically, this is not really different with using a sequential `Int64` key except this is
theoretically infinite. (`Int64` keys are just *practically* infinite)
Also this is not really different with using `ObjectIdentifier` key exception this is
globally ordered. (`ObjectIdentifier` keys are unordered.)
You can combine two things to obtain both attribute. And that is just what `TimePoint`
does.

Limitations
--------------
For now, this is limited to main-thread only.
*Globally ordered* concept needs locking of seed value to be multi-threaded, and I don't
have needs for that for now.

Credits
----------
Licensed under "MIT License".
Contributions will also be licensed under same license.
Copyright 2017 Hoon H.. All rights reserved.
