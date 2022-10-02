# Type-Animation
typing animation 

# Simple demo to achieve typing animation with both (reveal and hide) or (forward and backward).
## using native swift 5 "CADisplayLink" from [apple docs](https://pages.github.com/).

### you can easily change the character typing speed using attribute : "preferredFramesPerSecond" :
```
displayLink.preferredFramesPerSecond = 4

```

:🛑 Must invalidate displayLink else runLoop wouldn't stop.

![](https://github.com/iAboelnaga/Type-Animation/blob/main/Demo.gif)
