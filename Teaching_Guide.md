# Array Algorithms in Processing
## Teacher's Guide

This guide provides detailed instructions for teaching the 2-hour workshop on array algorithms in Processing, with specific talking points, examples, and transitions for each section.

### Preparation Before Class

1. Ensure Processing is installed on all computers
2. Have the following materials ready to distribute:
   - Student handout
   - Starter code file
3. Set up projector to display your code examples
4. Prepare a timer to keep track of section durations

### Introduction (10 minutes)

**Speaking Points:**
> "Welcome to our workshop on array algorithms using Processing! Today, we'll be focusing on common array manipulation techniques that frequently appear on AP Computer Science A Free Response Questions. By the end of our session, you'll be able to implement these key patterns and apply them to solve a variety of problems."

> "Let's start by making sure everyone has Processing open and has received the starter code. Go ahead and create a new sketch and copy in the starter code from the handout. This will give us a framework to build on as we explore each algorithm pattern."

> "Array manipulation is a fundamental skill in computer science. These algorithms form building blocks that you'll use throughout your programming career, and they're frequently tested on the AP exam. We'll cover six main patterns today: accumulator patterns, finding min/max values, testing array properties, working with pairs and duplicates, rotating arrays, and reversing arrays."

> "Before we dive in, let's quickly review the structure of an array in Processing. Arrays are fixed-size collections of elements of the same type. They're indexed starting at 0, and we access elements using square bracket notation."

*Demonstrate creating and accessing an array:*
```processing
int[] numbers = {5, 12, 8, 3, 7, 15, 6};
println(numbers[0]);  // Outputs: 5
println(numbers[3]);  // Outputs: 3
println(numbers.length);  // Outputs: 7
```

### 6.4.1 Accumulator Pattern (20 minutes)

#### **Instructor Demonstration** (5 minutes)

**Speaking Points:**
> "The accumulator pattern is one of the most common algorithms you'll use with arrays. It involves initializing a variable—our accumulator—and then updating it as we process each element in the array."

> "Let's look at the classic example: finding the sum of all elements in an array."

*Write on board/display:*
```processing
int[] numbers = {7, 12, 3, 5, 18, 11, 9};
int sum = 0;  // Initialize accumulator to neutral value
for (int i = 0; i < numbers.length; i++) {
  sum += numbers[i];  // Add each element to accumulator
}
println("Sum: " + sum);  // Outputs: 65
```

> "Notice three key components here: First, we initialize our accumulator to a neutral value—zero for addition. Second, we use a loop to visit each element. Third, we update our accumulator with a specific operation for each element."

> "We can easily modify this pattern to calculate an average by dividing the sum by the array length:"

```processing
float average = (float)sum / numbers.length;  // Type cast to get decimal division
println("Average: " + average);  // Outputs: 9.285714
```

> "Let's consider some variations. What if we wanted to find the product of all elements? Or only sum elements that meet certain criteria?"

*Show variations:*
```processing
// Product of all elements
int product = 1;  // Note: neutral value for multiplication is 1
for (int i = 0; i < numbers.length; i++) {
  product *= numbers[i];
}

// Sum of only even numbers
int evenSum = 0;
for (int i = 0; i < numbers.length; i++) {
  if (numbers[i] % 2 == 0) {
    evenSum += numbers[i];
  }
}
```

> "The beauty of the accumulator pattern is its flexibility. By changing the initialization value, the update operation, or adding conditions, we can solve a wide range of problems."

#### **Guided Implementation** (10 minutes)

**Speaking Points:**
> "Now let's implement a function together that calculates the sum of elements at even indices—that's positions 0, 2, 4, and so on."

> "Let's start by writing the function signature from our starter code:"

```processing
int sumEvenIndices(int[] arr) {
  // Your code here
  return 0;
}
```

> "First, we need an accumulator. What's an appropriate initial value? Since we're summing, we'll start with zero."

```processing
int sumEvenIndices(int[] arr) {
  int sum = 0;
  
  return sum;
}
```

> "Next, we need to loop through the array. But we only want even indices. How can we modify our loop to achieve this?"

*Elicit responses from students*

```processing
int sumEvenIndices(int[] arr) {
  int sum = 0;
  for (int i = 0; i < arr.length; i += 2) {  // Note the i += 2
    sum += arr[i];
  }
  return sum;
}
```

> "Notice how we're incrementing our index by 2 each time—this ensures we only visit indices 0, 2, 4, and so on. Let's trace through this with our example array:"

*Demonstrate tracing through the execution using the test array [5, 12, 8, 3, 7, 15, 6]*

> "Are there any edge cases we need to consider? What happens if the array is empty?"

*Discuss with students that the function already handles this correctly - loop won't execute, and sum stays 0*

> "Great! Let's run our code and verify it works correctly with the test cases."

*Run the code and check output*

#### **Individual Practice** (5 minutes)

**Speaking Points:**
> "Now it's your turn to practice this pattern. In your starter code, implement a function called `sumMultiplesOf3` that calculates the sum of all elements that are multiples of 3 in an array."

> "You'll need to use a conditional inside your loop to check if each element is a multiple of 3 before adding it to your accumulator. Take about 5 minutes to complete this, and then we'll discuss."

*Walk around the room to assist students as needed*

> "Let's review one solution to this problem:"

```processing
int sumMultiplesOf3(int[] arr) {
  int sum = 0;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 3 == 0) {  // Check if element is divisible by 3
      sum += arr[i];
    }
  }
  return sum;
}
```

> "For our example array [5, 12, 8, 3, 7, 15, 6], the result would be 12 + 3 + 15 + 6 = 36."

### 6.4.2 Min, Max, Search Algorithms (20 minutes)

#### **Instructor Demonstration** (5 minutes)

**Speaking Points:**
> "Our next pattern focuses on finding extreme values—minimum and maximum—and searching for specific elements in arrays. These are fundamental operations you'll use constantly."

> "Let's start with finding the minimum value in an array:"

```processing
int[] values = {42, 17, 9, 36, 8, 25, 13};
int min = values[0];  // Start with first element as the minimum

for (int i = 1; i < values.length; i++) {  // Note: start from index 1
  if (values[i] < min) {
    min = values[i];  // Update min when we find a smaller value
  }
}
println("Minimum value: " + min);  // Outputs: 8
```

> "Notice the key steps: First, we initialize our answer with a reasonable starting point—the first element. Second, we compare each element to our current answer, updating when appropriate."

> "The maximum value works similarly, but with the comparison flipped:"

```processing
int max = values[0];
for (int i = 1; i < values.length; i++) {
  if (values[i] > max) {
    max = values[i];
  }
}
println("Maximum value: " + max);  // Outputs: 42
```

> "Now, what if we want to find a specific value in our array? This is called linear search:"

```processing
int target = 25;
int index = -1;  // Default: not found

for (int i = 0; i < values.length; i++) {
  if (values[i] == target) {
    index = i;
    break;  // Exit the loop once found
  }
}

if (index != -1) {
  println("Found target at index: " + index);  // Outputs: Found target at index: 5
} else {
  println("Target not found");
}
```

> "The key aspects of search algorithms include: having a way to indicate 'not found' (typically -1 for index), checking each element systematically, and deciding whether to stop once a match is found or to continue searching for all matches."

#### **Guided Implementation** (10 minutes)

**Speaking Points:**
> "Let's implement the `findSecondLargest` function together. This is a bit more challenging because we need to track two values: the largest and second-largest elements we've seen so far."

```processing
int findSecondLargest(int[] arr) {
  // Your code here
  return 0;
}
```

> "What are some initial considerations? First, the array needs at least two elements to have a second-largest value. Let's handle that edge case:"

```processing
int findSecondLargest(int[] arr) {
  if (arr.length < 2) {
    return Integer.MIN_VALUE;  // Error case—could also return another sentinel value
  }
  
  return 0;
}
```

> "Now, how do we keep track of both the largest and second-largest values? We'll need two variables:"

```processing
int findSecondLargest(int[] arr) {
  if (arr.length < 2) {
    return Integer.MIN_VALUE;
  }
  
  int largest = arr[0];
  int secondLargest = Integer.MIN_VALUE;
  
  return secondLargest;
}
```

> "Wait, is that initialization for secondLargest correct? What if all array elements are negative? Let's think about this carefully."

*Discuss with students - what if element 0 is the largest in the entire array?*

> "We should actually check the first two elements to initialize our variables:"

```processing
int findSecondLargest(int[] arr) {
  if (arr.length < 2) {
    return Integer.MIN_VALUE;
  }
  
  int largest, secondLargest;
  if (arr[0] > arr[1]) {
    largest = arr[0];
    secondLargest = arr[1];
  } else {
    largest = arr[1];
    secondLargest = arr[0];
  }
  
  return secondLargest;
}
```

> "Now we need to process the rest of the array, updating our two tracked values as needed:"

```processing
int findSecondLargest(int[] arr) {
  if (arr.length < 2) {
    return Integer.MIN_VALUE;
  }
  
  int largest = arr[0];
  int secondLargest = Integer.MIN_VALUE;
  
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] > largest) {
      secondLargest = largest;  // Current largest becomes second largest
      largest = arr[i];         // New value becomes largest
    } else if (arr[i] > secondLargest && arr[i] < largest) {
      // If value is between largest and second largest, update second largest
      secondLargest = arr[i];
    }
  }
  
  return secondLargest;
}
```

> "Let's trace through this with our example array [5, 12, 8, 3, 7, 15, 6]:"

*Walk through step-by-step execution, showing how largest and secondLargest change*

> "What about duplicates? If the largest value appears twice, our algorithm will still work correctly because we only update secondLargest if the value is less than largest."

> "Let's run our code to verify it works correctly."

*Run the code and check output*

#### **Individual Practice** (5 minutes)

**Speaking Points:**
> "For your individual practice, implement the `linearSearch` function that returns the index of the first occurrence of a target value, or -1 if not found. Take about 5 minutes to complete this task."

*After 5 minutes:*

> "Let's review a solution:"

```processing
int linearSearch(int[] arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i;  // Found the target, return its index
    }
  }
  return -1;  // Target not found
}
```

> "Note how we return immediately when the target is found, rather than setting a variable and breaking the loop. Both approaches work, but this one is more concise."

### 6.4.3 Test Property (15 minutes)

#### **Instructor Demonstration** (5 minutes)

**Speaking Points:**
> "Our next pattern involves testing whether array elements satisfy certain properties or conditions. This is a common pattern in FRQs, where you might need to check if all elements meet a criterion, if any element meets it, or if none do."

> "Let's start with an example: checking if all elements in an array are positive:"

```processing
boolean allPositive(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] <= 0) {
      return false;  // Found a non-positive number
    }
  }
  return true;  // Made it through the whole array without finding a non-positive
}
```

> "Notice the structure: we look for a single counterexample. If we find it, we can immediately return false. If we make it through the entire array without finding a counterexample, we return true."

> "What if we want to check if any element meets a condition? The structure is similar but flipped:"

```processing
boolean anyDivisibleBySeven(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 7 == 0) {
      return true;  // Found an element divisible by 7
    }
  }
  return false;  // No element is divisible by 7
}
```

> "The pattern for 'none' is essentially the same as 'all' but with the condition negated, or the same as 'any' with the return values flipped."

> "There are also more complex properties we can test, like whether an array is sorted, is a palindrome, or contains consecutive duplicates. The key is to identify what pattern we're looking for and return as soon as we can determine the answer."

#### **Guided Implementation** (5 minutes)

**Speaking Points:**
> "Let's implement the `isSorted` function together. This function should return true if the array is in ascending order—that is, each element is greater than or equal to the previous element."

```processing
boolean isSorted(int[] arr) {
  // Your code here
  return false;
}
```

> "To check if an array is sorted, we need to compare each element with its previous element. If we find any element that's smaller than its predecessor, the array isn't sorted."

```processing
boolean isSorted(int[] arr) {
  // What about edge cases? Arrays with 0 or 1 element?
  if (arr.length <= 1) {
    return true;  // Empty arrays and arrays with 1 element are always sorted
  }
  
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < arr[i - 1]) {
      return false;  // Found an element smaller than its predecessor
    }
  }
  return true;  // Made it through the whole array without finding an out-of-order element
}
```

> "Note that we start our loop at index 1, since we're comparing each element to its predecessor. Let's trace through this with a few example arrays."

*Demonstrate with [5, 8, 12, 15] (sorted) and [5, 12, 8, 15] (not sorted)*

> "Let's run our code to verify it works correctly."

*Run the code and check output*

#### **Individual Practice** (5 minutes)

**Speaking Points:**
> "For your practice, implement a function called `containsDuplicates` that returns true if the array contains any duplicate values. Take about 5 minutes to complete this."

*Walk around to assist students. After 5 minutes:*

> "Let's review a solution. We need to compare each element with every other element in the array. This requires a nested loop:"

```processing
boolean containsDuplicates(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] == arr[j]) {
        return true;  // Found a duplicate
      }
    }
  }
  return false;  // No duplicates found
}
```

> "Note the inner loop starts at i + 1 to avoid comparing an element with itself and to avoid comparing the same pair of elements twice. This approach has O(n²) time complexity, but for small arrays, it's straightforward."

### 6.4.4 Pairs and Duplicates (20 minutes)

#### **Instructor Demonstration** (5 minutes)

**Speaking Points:**
> "Our next pattern deals with finding and processing pairs of elements in arrays. This is a natural extension of the property testing we just covered, but now we're interested in relationships between pairs of elements."

> "Let's start with counting pairs of elements that sum to a target value:"

```processing
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

> "Notice the nested loop structure: the outer loop selects one element, and the inner loop compares it with all subsequent elements. This ensures we don't count the same pair twice."

> "Another common pattern is finding duplicates in an array:"

```processing
ArrayList<Integer> findDuplicates(int[] arr) {
  ArrayList<Integer> duplicates = new ArrayList<Integer>();
  
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] == arr[j] && !duplicates.contains(arr[i])) {
        duplicates.add(arr[i]);
        break;  // Found one instance of this duplicate, no need to count it again
      }
    }
  }
  
  return duplicates;
}
```

> "In both examples, we're using nested loops to examine all possible pairs of elements in the array. This is a powerful pattern, but be aware that it has O(n²) time complexity."

#### **Guided Implementation** (10 minutes)

**Speaking Points:**
> "Let's implement the `hasConsecutiveDuplicates` function together. This function should return true if the array contains any consecutive duplicate values."

```processing
boolean hasConsecutiveDuplicates(int[] arr) {
  // Your code here
  return false;
}
```

> "The key here is 'consecutive'—we're looking for duplicate values that are adjacent to each other in the array. How would we check for this?"

*Elicit responses from students*

```processing
boolean hasConsecutiveDuplicates(int[] arr) {
  // First, let's consider edge cases
  if (arr.length <= 1) {
    return false;  // Arrays with 0 or 1 element can't have consecutive duplicates
  }
  
  // Now check for consecutive duplicates
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] == arr[i + 1]) {
      return true;  // Found consecutive duplicates
    }
  }
  return false;  // No consecutive duplicates found
}
```

> "Notice that we're comparing each element with its immediate successor, so our loop only needs to go up to the second-to-last element. This is a much simpler and more efficient approach than the nested loop we used for general duplicates."

> "Let's trace through this with a few examples:"

*Demonstrate with [5, 12, 12, 8, 15] (has consecutive duplicates) and [5, 12, 8, 15, 8] (no consecutive duplicates)*

> "Let's run our code to verify it works correctly."

*Run the code and check output*

#### **Individual Practice** (5 minutes)

**Speaking Points:**
> "For your practice, implement the `countDoubleAdjacentPairs` function that counts the number of adjacent pairs where one element is double the other. Take about 5 minutes to complete this."

*After 5 minutes:*

> "Let's review a solution:"

```processing
int countDoubleAdjacentPairs(int[] arr) {
  int count = 0;
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] == 2 * arr[i + 1] || arr[i + 1] == 2 * arr[i]) {
      count++;
    }
  }
  return count;
}
```

> "This function checks each adjacent pair and increments the count if either element is double the other. We need to check both possibilities: arr[i] could be double arr[i+1], or arr[i+1] could be double arr[i]."

### 6.4.5 Rotating Array Elements (15 minutes)

#### **Instructor Demonstration** (5 minutes)

**Speaking Points:**
> "Our next pattern involves rotating elements in an array—shifting them left or right while wrapping around the ends. This is a common operation that tests your ability to manipulate array elements in place."

> "Let's start with rotating an array one position to the right:"

```processing
void rotateRight(int[] arr) {
  if (arr.length <= 1) return;  // Nothing to rotate
  
  int last = arr[arr.length - 1];  // Save the last element
  for (int i = arr.length - 1; i > 0; i--) {
    arr[i] = arr[i - 1];  // Shift each element right
  }
  arr[0] = last;  // Place the saved element at the beginning
}
```

*Visualize the rotation with a sample array:*
```
Original: [5, 12, 8, 3, 7]
After rotation: [7, 5, 12, 8, 3]
```

> "Notice the key steps: First, we save the element that would be 'pushed off' the end. Then, we shift all other elements in the direction of the rotation. Finally, we place the saved element at the other end."

> "Rotating left works similarly, but we save the first element and shift elements left:"

```processing
void rotateLeft(int[] arr) {
  if (arr.length <= 1) return;
  
  int first = arr[0];  // Save the first element
  for (int i = 0; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];  // Shift each element left
  }
  arr[arr.length - 1] = first;  // Place the saved element at the end
}
```

> "These functions rotate by one position, but we often need to rotate by multiple positions. We could call the single-position rotation multiple times, but there's a more efficient approach using a temporary array."

#### **Guided Implementation** (5 minutes)

**Speaking Points:**
> "Let's implement the `rotateRightByK` function together. This function should rotate all elements in the array to the right by k positions."

```processing
void rotateRightByK(int[] arr, int k) {
  // Your code here
}
```

> "First, let's handle some edge cases. What if the array is empty or has only one element? What if k is larger than the array length?"

```processing
void rotateRightByK(int[] arr, int k) {
  if (arr.length <= 1) return;  // Nothing to rotate
  
  k = k % arr.length;  // Handle k > array length
  if (k == 0) return;  // No rotation needed
}
```

> "Now, we have two main approaches. We could repeatedly call the single-position rotation k times, but that's inefficient for large k. Instead, let's use a temporary array to store the elements that would wrap around:"

```processing
void rotateRightByK(int[] arr, int k) {
  if (arr.length <= 1) return;
  
  k = k % arr.length;
  if (k == 0) return;
  
  // Create a temporary array to store the last k elements
  int[] temp = new int[k];
  for (int i = 0; i < k; i++) {
    temp[i] = arr[arr.length - k + i];
  }
  
  // Shift all elements k positions to the right
  for (int i = arr.length - 1; i >= k; i--) {
    arr[i] = arr[i - k];
  }
  
  // Copy the temporary elements to the beginning
  for (int i = 0; i < k; i++) {
    arr[i] = temp[i];
  }
}
```

> "Let's trace through this with an example array [5, 12, 8, 3, 7, 15, 6] and k = 3:"

*Demonstrate the algorithm step by step*

> "Let's run our code to verify it works correctly."

*Run the code and check output*

#### **Individual Practice** (5 minutes)

**Speaking Points:**
> "For your practice, implement a function called `rotateLeftByK` that rotates an array to the left by k positions. The approach will be similar to what we just did for right rotation. Take about 5 minutes to complete this task."

*After 5 minutes:*

> "Here's a solution for rotating left by k positions:"

```processing
void rotateLeftByK(int[] arr, int k) {
  if (arr.length <= 1) return;
  
  k = k % arr.length;
  if (k == 0) return;
  
  // Store first k elements in temporary array
  int[] temp = new int[k];
  for (int i = 0; i < k; i++) {
    temp[i] = arr[i];
  }
  
  // Shift elements to the left
  for (int i = 0; i < arr.length - k; i++) {
    arr[i] = arr[i + k];
  }
  
  // Place temporary elements at the end
  for (int i = 0; i < k; i++) {
    arr[arr.length - k + i] = temp[i];
  }
}
```

> "This approach is nearly identical to right rotation, but we save the first k elements and shift left."

### 6.4.6 Reversing an Array (10 minutes)

#### **Instructor Demonstration** (3 minutes)

**Speaking Points:**
> "Our final pattern involves reversing the order of elements in an array. This is a fundamental operation that can be combined with other patterns to solve complex problems."

> "Here's how we reverse an entire array in place:"

```processing
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

*Visualize the reversal process with a sample array:*
```
Original: [5, 12, 8, 3, 7]
Step 1: Swap 5 and 7 → [7, 12, 8, 3, 5]
Step 2: Swap 12 and 3 → [7, 3, 8, 12, 5]
Step 3: 8 stays in place → [7, 3, 8, 12, 5]
```

> "This algorithm uses two pointers—left and right—that start at the ends of the array and move toward the center. At each step, we swap the elements at these positions. The process continues until the pointers meet or cross, at which point the array is reversed."

#### **Guided Implementation** (3 minutes)

**Speaking Points:**
> "Let's implement the `reverseSection` function together. This function should reverse only the elements from index `start` to index `end` (inclusive)."

```processing
void reverseSection(int[] arr, int start, int end) {
  // Your code here
}
```

> "First, let's check that the inputs are valid. What conditions should we check?"

```processing
void reverseSection(int[] arr, int start, int end) {
  if (start < 0 || end >= arr.length || start > end) return;
  
  // Now we'll apply the same two-pointer technique, but with our custom bounds
  while (start < end) {
    // Swap elements
    int temp = arr[start];
    arr[start] = arr[end];
    arr[end] = temp;
    
    // Move towards center
    start++;
    end--;
  }
}
```

> "This is essentially the same algorithm as full array reversal, but we're applying it to a specific section of the array. Let's verify it works with our test case."

*Run the code and check output*

#### **Individual Practice** (4 minutes)

**Speaking Points:**
> "For a quick practice, implement a function called `isPalindrome` that returns true if an array reads the same forward and backward. You can use the reversal concept we just covered. Take about 4 minutes for this task."

*After 4 minutes:*

> "Here's one approach to solving this problem:"

```processing
boolean isPalindrome(int[] arr) {
  int left = 0;
  int right = arr.length - 1;
  
  while (left < right) {
    if (arr[left] != arr[right]) {
      return false;  // Elements don't match
    }
    left++;
    right--;
  }
  return true;  // All elements matched
}
```

> "Notice that we're using the same two-pointer technique as in reversal, but instead of swapping elements, we're checking if they're the same. If we find any pair that doesn't match, the array isn't a palindrome."

### Final Challenge (15 minutes)

**Speaking Points:**
> "Now it's time for our final challenge problem: implementing the `rearrangeEvenOdd` function. This function should rearrange an array so that all even numbers come before all odd numbers, while maintaining the relative order of the even numbers and the relative order of the odd numbers."

> "For example, if the input is [3, 8, 2, 5, 9, 6, 7, 4], the output should be [8, 2, 6, 4, 3, 5, 9, 7]. All even numbers (8, 2, 6, 4) appear first, followed by all odd numbers (3, 5, 9, 7), and the original order within each group is preserved."

> "This problem combines several of the patterns we've covered today. Take 15 minutes to work on it. You can work individually or pair up with a neighbor if you'd like."

*During the 15 minutes, walk around to assist students and observe different approaches.*

> "Let's discuss a solution to this challenge. One approach is to use two passes through the array:"

```processing
void rearrangeEvenOdd(int[] arr) {
  int[] result = new int[arr.length];
  int evenPos = 0;
  int oddPos = 0;
  
  // First pass: count even numbers to determine where odd numbers start
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 2 ==
