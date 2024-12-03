# Test App Exercise
Made by Omar Ashraf
This is a test app exercise which had performance issues. I have modified the code to address these issues. Below are the notes on the changes made:

## Issues in the Code and Fixes

1. **Add `const`**:
    - Added `const` keyword to improve performance by making widgets compile-time constants where possible so each time we don't have to build from scratch.
    - Applied to:
      - Duration
      - Text
      - CircleAvatar

2. **Dispose the Animated Container Timer**:
    - Ensured that the timer used in the AnimatedContainer is properly disposed of to prevent memory leaks.

3. **Add `RepaintBoundary` around the Animated Container**:
    - Wrapped the AnimatedContainer with a `RepaintBoundary` to optimize the repaint process and improve performance.

4. **Use `CachedNetworkImage`**:
    - Replaced `NetworkImage` with `CachedNetworkImage` to cache images and reduce network calls by not calling the image url each time, enhancing performance.

5. **Use `ListView.builder`**:
    - Replaced `ListView` and `List.generate` with `ListView.builder` to efficiently build list items on demand, improving performance for large lists and apply efficiently lazy loading.

## Conclusion

These changes should help in improving the performance of the app by optimizing widget rebuilds, managing resources efficiently, and reducing unnecessary network calls as the task given by Amir needs.