# Test App Exercise
Made by Omar Ashraf
This is the second test app exercise which had performance issues. I have modified the code to address these issues. Below are the notes on the changes made:

## Issues in the Code and Fixes

1. **Using `compute`**:
    - Added `compute` function in generate products function to made the generate function in a separate thread.

2. **Using `DI`**:
    - Added `DI` dependency injection to avoid using multiple instance.

3. Separated the services function in a `services` folder.

4. Used StateManagement to manage the UI using `CUBIT`.

5. Used `Factory` design pattern by separating each product UI by its category.

6. Used `Pagination` to lazy load the products.


## Conclusion

These features in the app as the task given by Amir.