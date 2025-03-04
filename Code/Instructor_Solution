// Array Algorithms in Processing
// INSTRUCTOR SOLUTION GUIDE

// ======== 1. Accumulator Pattern ========

// Calculate sum of elements at even indices (0, 2, 4, etc.)
int sumEvenIndices(int[] arr) {
  int sum = 0;
  for (int i = 0; i < arr.length; i += 2) { // Note increment by 2
    sum += arr[i];
  }
  return sum;
}

// ======== 2. Min, Max, Search Algorithms ========

// Find the second-largest value in the array
int findSecondLargest(int[] arr) {
  if (arr.length < 2) return Integer.MIN_VALUE; // Error case
  
  int largest = arr[0];
  int secondLargest = Integer.MIN_VALUE;
  
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] > largest) {
      secondLargest = largest;
      largest = arr[i];
    } else if (arr[i] > secondLargest && arr[i] < largest) {
      secondLargest = arr[i];
    }
  }
  
  return secondLargest;
}

// Linear search - find index of target or return -1 if not found
int linearSearch(int[] arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i;
    }
  }
  return -1; // Not found
}

// ======== 3. Test Property ========

// Check if array is sorted in ascending order
boolean isSorted(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      return false;
    }
  }
  return true;
}

// ======== 4. Pairs and Duplicates ========

// Check if array has consecutive duplicate values
boolean hasConsecutiveDuplicates(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] == arr[i + 1]) {
      return true;
    }
  }
  return false;
}

// Count pairs where one element is double the other
int countDoubleAdjacentPairs(int[] arr) {
  int count = 0;
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] == 2 * arr[i + 1] || arr[i + 1] == 2 * arr[i]) {
      count++;
    }
  }
  return count;
}

// ======== 5. Rotating Array Elements ========

// Rotate elements right by k positions
void rotateRightByK(int[] arr, int k) {
  int n = arr.length;
  if (n <= 1) return;
  
  k = k % n; // Handle k > array length
  if (k == 0) return;
  
  // Method 1: Using a temporary array
  int[] temp = new int[k];
  for (int i = 0; i < k; i++) {
    temp[i] = arr[n - k + i];
  }
  
  // Shift elements to the right
  for (int i = n - 1; i >= k; i--) {
    arr[i] = arr[i - k];
  }
  
  // Put the temp elements at the beginning
  for (int i = 0; i < k; i++) {
    arr[i] = temp[i];
  }
  
  /* Alternative method: Rotate one position k times
  for (int i = 0; i < k; i++) {
    int last = arr[n-1];
    for (int j = n-1; j > 0; j--) {
      arr[j] = arr[j-1];
    }
    arr[0] = last;
  }
  */
}

// ======== 6. Reversing an Array ========

// Reverse a section of an array (from index start to index end inclusive)
void reverseSection(int[] arr, int start, int end) {
  if (start < 0 || end >= arr.length || start > end) return;
  
  while (start < end) {
    // Swap elements
    int temp = arr[start];
    arr[start] = arr[end];
    arr[end] = temp;
    
    // Move inward
    start++;
    end--;
  }
}

// ======== Challenge Problem ========

// Rearrange array so all even numbers come before all odd numbers
// while maintaining relative order within even and odd groups
void rearrangeEvenOdd(int[] arr) {
  int[] result = new int[arr.length];
  int evenPos = 0;
  int oddPos = 0;
  
  // First pass: count even numbers to determine where odd numbers start
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 2 == 0) {
      evenPos++;
    }
  }
  
  oddPos = evenPos; // Odd numbers start after all even numbers
  evenPos = 0;      // Reset even position counter for second pass
  
  // Second pass: place numbers in the correct positions
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 2 == 0) {
      result[evenPos] = arr[i];
      evenPos++;
    } else {
      result[oddPos] = arr[i];
      oddPos++;
    }
  }
  
  // Copy result back to original array
  for (int i = 0; i < arr.length; i++) {
    arr[i] = result[i];
  }
}

// Alternative approach for the challenge problem using two temporary arrays
void rearrangeEvenOddAlternative(int[] arr) {
  // Count even and odd numbers
  int evenCount = 0;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 2 == 0) {
      evenCount++;
    }
  }
  
  // Create temporary arrays
  int[] evens = new int[evenCount];
  int[] odds = new int[arr.length - evenCount];
  
  // Fill temporary arrays
  int evenIndex = 0;
  int oddIndex = 0;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 2 == 0) {
      evens[evenIndex] = arr[i];
      evenIndex++;
    } else {
      odds[oddIndex] = arr[i];
      oddIndex++;
    }
  }
  
  // Copy back to original array
  for (int i = 0; i < evenCount; i++) {
    arr[i] = evens[i];
  }
  for (int i = 0; i < odds.length; i++) {
    arr[evenCount + i] = odds[i];
  }
}

// ======== Test Code ========

void setup() {
  size(600, 400);
  background(240);
  textSize(16);
  
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
  
  // Visualize arrays
  visualizeArray(test1, 50, 300);
  
  noLoop();
}

// Helper function to display arrays as strings
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

// Helper function to visualize arrays
void visualizeArray(int[] arr, int x, int y) {
  int barWidth = 30;
  int spacing = 5;
  int maxHeight = 150;
  
  // Find max value for scaling
  int maxVal = arr[0];
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] > maxVal) {
      maxVal = arr[i];
    }
  }
  
  for (int i = 0; i < arr.length; i++) {
    int barHeight = int(map(arr[i], 0, maxVal, 10, maxHeight));
    fill(60, 120, 200);
    rect(x + i * (barWidth + spacing), y - barHeight, barWidth, barHeight);
    fill(0);
    text(arr[i], x + i * (barWidth + spacing) + barWidth/4, y + 15);
  }
}

/* 
TEACHING NOTES:

1. Accumulator Pattern:
   - Emphasize how accumulator variables start at a neutral value (0 for sum, 1 for product)
   - Point out different iteration patterns (i+=2 for even indices)
   - Demonstrate cumulative calculations with different conditions

2. Min/Max/Search:
   - Highlight initialization with first element or extreme values
   - Discuss the importance of handling empty arrays and edge cases
   - Cover linear vs. binary search (sorted arrays)

3. Testing Properties:
   - Stress early returns for efficiency
   - Compare approaches for "all", "any", and "none" patterns
   - Show how to check properties like "sorted", "palindrome", etc.

4. Pairs and Duplicates:
   - Emphasize nested loop structure for comparing pairs
   - Discuss efficiency concerns and potential optimizations
   - Show different patterns for consecutive vs. any-position pairs

5. Rotating Arrays:
   - Demonstrate both approaches: temporary array vs. multiple single rotations
   - Discuss trade-offs: memory vs. time efficiency
   - Explain the modulo operation for handling k > array length

6. Reversing Arrays:
   - Visualize the two-pointer approach moving from outside in
   - Show how the same pattern works for sections
   - Connect to palindrome detection

Common Student Mistakes:
1. Off-by-one errors in loop bounds
2. Forgetting to handle edge cases (empty arrays, single elements)
3. Confusion between index and value
4. Not properly initializing variables (especially for min/max)
5. Mutating arrays during iteration without a temporary variable
*/
