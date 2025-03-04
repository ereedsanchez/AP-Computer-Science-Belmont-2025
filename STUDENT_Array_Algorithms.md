# Array Algorithms in Processing
## Student Handout

### Course Overview
This 2-hour workshop covers common array algorithms that frequently appear in AP Computer Science A Free Response Questions (FRQs). You'll learn to implement these algorithms using the Processing programming language.

### Before You Begin
1. Make sure Processing is installed on your computer
2. Create a new sketch folder for today's exercises
3. Have this handout available for reference during exercises

### Key Concepts We'll Cover

## 1. Accumulator Pattern for Sum/Average

The accumulator pattern uses a variable to build up a result by processing each array element.

**Basic Example:**
```processing
int[] numbers = {7, 12, 3, 5, 18, 11, 9};
int sum = 0;
for (int i = 0; i < numbers.length; i++) {
  sum += numbers[i];  // Add each element to our accumulator
}
float average = (float)sum / numbers.length;
```

**Your Task:** Complete the `sumEvenIndices` function below to calculate the sum of all elements at even indices (0, 2, 4, etc.).

```processing
int sumEvenIndices(int[] arr) {
  // Your code here
  
  return 0; // Replace with your actual return value
}
```

## 2. Min, Max, Search Algorithms

These algorithms find extreme values or specific elements in arrays.

**Basic Example:**
```processing
int[] values = {42, 17, 9, 36, 8, 25, 13};
int min = values[0]; // Start with first element

for (int i = 1; i < values.length; i++) {
  if (values[i] < min) {
    min = values[i];
  }
}
```

**Your Task:** Complete the `findSecondLargest` function to return the second-largest value in an array.

```processing
int findSecondLargest(int[] arr) {
  // Your code here
  
  return 0; // Replace with your actual return value
}
```

## 3. Testing Properties of Arrays

These algorithms check if array elements satisfy certain conditions.

**Basic Example:**
```processing
// Check if all elements are positive
boolean allPositive(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] <= 0) {
      return false; // Found a non-positive number
    }
  }
  return true; // All elements are positive
}
```

**Your Task:** Complete the `isSorted` function to return true if an array is in ascending order (each element is greater than or equal to the previous element).

```processing
boolean isSorted(int[] arr) {
  // Your code here
  
  return false; // Replace with your actual return value
}
```

## 4. Pairs and Duplicates in Arrays

These algorithms identify relationships between array elements.

**Basic Example:**
```processing
// Count pairs where elements sum to a target value
int countPairsWithSum(int[] arr, int targetSum) {
  int count = 0;
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] == targetSum) {
        count++;
      }
    }
  }
  return count;
}
```

**Your Task:** Complete the `hasConsecutiveDuplicates` function to return true if the array contains any consecutive duplicate values.

```processing
boolean hasConsecutiveDuplicates(int[] arr) {
  // Your code here
  
  return false; // Replace with your actual return value
}
```

## 5. Rotating Array Elements

These algorithms shift elements left or right, wrapping around the ends.

**Basic Example:**
```processing
// Rotate array elements to the right by 1 position
void rotateRight(int[] arr) {
  if (arr.length <= 1) return;  // Nothing to rotate
  
  int last = arr[arr.length - 1];
  for (int i = arr.length - 1; i > 0; i--) {
    arr[i] = arr[i - 1];
  }
  arr[0] = last;
}
```

**Your Task:** Complete the `rotateRightByK` function to rotate all elements in the array to the right by k positions.

```processing
void rotateRightByK(int[] arr, int k) {
  // Your code here
}
```

## 6. Reversing an Array

These algorithms reverse the order of elements in all or part of an array.

**Basic Example:**
```processing
// Reverse array elements in-place
void reverseArray(int[] arr) {
  int left = 0;
  int right = arr.length - 1;
  
  while (left < right) {
    // Swap elements at left and right indices
    int temp = arr[left];
    arr[left] = arr[right];
    arr[right] = temp;
    
    // Move indices toward the center
    left++;
    right--;
  }
}
```

**Your Task:** Complete the `reverseSection` function to reverse only the elements from index `start` to index `end` (inclusive).

```processing
void reverseSection(int[] arr, int start, int end) {
  // Your code here
}
```

## FRQ-Style Challenge Problem

**Problem:** Implement a function called `rearrangeEvenOdd` that rearranges an array so that all even numbers come before all odd numbers, while maintaining the relative order of the even numbers and the relative order of the odd numbers.

Example: 
- Input: [3, 8, 2, 5, 9, 6, 7, 4]
- Output: [8, 2, 6, 4, 3, 5, 9, 7]

```processing
void rearrangeEvenOdd(int[] arr) {
  // Your code here
}
```

### Testing Your Work

After completing each function, use this test code to verify your answers:

```processing
void setup() {
  // Test arrays
  int[] test1 = {5, 12, 8, 3, 7, 15, 6};
  int[] test2 = {5, 2, 8, 9, 7, 3, 6, 1, 4};
  
  // Test your functions
  println("sumEvenIndices: " + sumEvenIndices(test1));
  println("Second largest: " + findSecondLargest(test1));
  println("Is sorted: " + isSorted(test1));
  
  println("Has consecutive duplicates: " + hasConsecutiveDuplicates(test1));
  
  // Test rotation
  println("Before rotation: " + arrayToString(test2));
  rotateRightByK(test2, 3);
  println("After rotation: " + arrayToString(test2));
  
  // Reset array for next test
  test2 = new int[]{5, 2, 8, 9, 7, 3, 6, 1, 4};
  
  // Test reversal
  println("Before reversal: " + arrayToString(test2));
  reverseSection(test2, 2, 5);
  println("After reversal: " + arrayToString(test2));
  
  // Test challenge problem
  test2 = new int[]{3, 8, 2, 5, 9, 6, 7, 4};
  println("Before rearrange: " + arrayToString(test2));
  rearrangeEvenOdd(test2);
  println("After rearrange: " + arrayToString(test2));
}

// Helper function to display arrays
String arrayToString(int[] arr) {
  String result = "[";
  for (int i = 0; i < arr.length; i++) {
    result += arr[i];
    if (i < arr.length - 1) {
      result += ", ";
    }
  }
  result += "]";
  return result;
}
```

## Tips for Array Algorithm Success

1. **Edge Cases**: Always consider empty arrays and arrays with one element.
2. **Index Bounds**: Be careful not to access indices outside the array bounds.
3. **Temporary Variables**: Use temporary variables for swapping elements.
4. **Start With Examples**: Trace through examples by hand before coding.
5. **Validate** your code with different test cases.

### Expected Output for Example Tests

```
sumEvenIndices: 19
Second largest: 12
Is sorted: false
Has consecutive duplicates: false
Before rotation: [5, 2, 8, 9, 7, 3, 6, 1, 4]
After rotation: [6, 1, 4, 5, 2, 8, 9, 7, 3]
Before reversal: [5, 2, 8, 9, 7, 3, 6, 1, 4]
After reversal: [5, 2, 3, 7, 9, 8, 6, 1, 4]
Before rearrange: [3, 8, 2, 5, 9, 6, 7, 4]
After rearrange: [8, 2, 6, 4, 3, 5, 9, 7]
```
