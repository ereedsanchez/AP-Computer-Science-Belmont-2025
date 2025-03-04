# Array Algorithms in Processing
## 2-Hour Class Curriculum

### Overview
This session focuses on common array algorithms that frequently appear in AP Computer Science A Free Response Questions (FRQs). Students will learn to implement and apply these algorithms using the Processing programming language.

### Learning Objectives
By the end of this class, students will be able to:
- Implement accumulator patterns for sum and average calculations
- Write algorithms to find minimum and maximum values in arrays
- Develop and apply search algorithms for arrays
- Test properties of array elements
- Identify and process pairs and duplicates in arrays
- Implement algorithms to rotate and reverse arrays
- Analyze and solve FRQ-style problems involving arrays

### Required Materials
- Processing IDE installed on student computers
- Class handout with algorithm patterns and practice problems
- Starter code files for in-class exercises

### Class Timeline

#### Introduction (10 minutes)
- Brief review of array basics in Processing
- Overview of common array algorithm patterns
- Connection to AP CSA FRQs

#### 6.4.1 Accumulator Pattern for Sum/Average (20 minutes)
- **Theory (5 min):**
  - Accumulator pattern explanation
  - Common variations and applications

- **Example (5 min):** 
```processing
// Finding sum and average of an array
int[] numbers = {7, 12, 3, 5, 18, 11, 9};
int sum = 0;
for (int i = 0; i < numbers.length; i++) {
  sum += numbers[i];
}
float average = (float)sum / numbers.length;
println("Sum: " + sum);
println("Average: " + average);
```

- **Variations (5 min):**
  - Calculating weighted averages
  - Conditional summing (e.g., sum of even numbers only)

- **Hands-on Exercise (5 min):**
  - Implement a function to find the sum of elements at even indices

#### 6.4.2 Min, Max, Search Algorithms (20 minutes)
- **Theory (5 min):**
  - Finding minimum and maximum values
  - Linear search algorithm
  - Edge cases and considerations

- **Example (5 min):**
```processing
// Finding minimum and maximum values
int[] values = {42, 17, 9, 36, 8, 25, 13};
int min = values[0]; // Start with first element
int max = values[0];

for (int i = 1; i < values.length; i++) {
  if (values[i] < min) {
    min = values[i];
  }
  if (values[i] > max) {
    max = values[i];
  }
}

// Linear search
int target = 25;
int foundIndex = -1;
for (int i = 0; i < values.length; i++) {
  if (values[i] == target) {
    foundIndex = i;
    break;  // Exit loop once found
  }
}
```

- **Hands-on Exercise (10 min):**
  - Implement a method that finds the second largest value in an array
  - Write a function that returns an array of all indices where a target value appears

#### 6.4.3 Test Property (15 minutes)
- **Theory (5 min):**
  - Algorithms to test if array elements meet certain conditions
  - All, any, none patterns

- **Example (5 min):**
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

// Check if any element is divisible by 7
boolean anyDivisibleBySeven(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 7 == 0) {
      return true; // Found an element divisible by 7
    }
  }
  return false; // No element is divisible by 7
}
```

- **Hands-on Exercise (5 min):**
  - Write a method that tests if an array is in sorted (ascending) order

#### 6.4.4 Pairs and Duplicates in Array (20 minutes)
- **Theory (5 min):**
  - Algorithms to find and process pairs of elements
  - Detecting duplicates in arrays
  - Nested loop approach

- **Example (5 min):**
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

// Find duplicates in an array
ArrayList<Integer> findDuplicates(int[] arr) {
  ArrayList<Integer> duplicates = new ArrayList<Integer>();
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] == arr[j] && !duplicates.contains(arr[i])) {
        duplicates.add(arr[i]);
        break;
      }
    }
  }
  return duplicates;
}
```

- **Hands-on Exercise (10 min):**
  - Implement a method that returns true if there are consecutive duplicate values
  - Write a function to count adjacent pairs where one element is twice the other

#### 6.4.5 Rotating Array Elements (15 minutes)
- **Theory (5 min):**
  - Shifting elements left or right
  - Handling wraparound 
  - Common applications

- **Example (5 min):**
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

// Rotate array elements to the left by k positions
void rotateLeft(int[] arr, int k) {
  k = k % arr.length;  // Handle k > array length
  if (k == 0) return;  // No rotation needed
  
  int[] temp = new int[k];
  
  // Store first k elements
  for (int i = 0; i < k; i++) {
    temp[i] = arr[i];
  }
  
  // Shift elements
  for (int i = 0; i < arr.length - k; i++) {
    arr[i] = arr[i + k];
  }
  
  // Place stored elements at the end
  for (int i = 0; i < k; i++) {
    arr[arr.length - k + i] = temp[i];
  }
}
```

- **Hands-on Exercise (5 min):**
  - Implement a function that rotates array elements to the right by k positions

#### 6.4.6 Reversing an Array (10 minutes)
- **Theory (3 min):**
  - In-place reversal algorithm
  - Applications of array reversal

- **Example (3 min):**
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

- **Hands-on Exercise (4 min):**
  - Write a function that reverses only a section of an array (from index a to index b)

#### FRQ-Style Problem (15 minutes)
- Students work on an AP CSA FRQ-style problem that combines multiple array algorithms
- Example problem: implement a method that rearranges an array so all even numbers come before odd numbers, while maintaining relative order among evens and odds

#### Wrap-up and Review (5 minutes)
- Summary of key array algorithm patterns
- Discussion of problem-solving strategies for array-based FRQs
- Q&A session

### Assessment
- In-class participation during guided examples
- Completion of hands-on exercises
- Performance on the final FRQ-style problem

### Extended Learning Resources
- Additional practice problems focusing on array algorithms
- Online interactive visualizations of array operations
- Past AP CSA FRQs involving arrays
