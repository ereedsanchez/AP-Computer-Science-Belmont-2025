// Array Algorithms in Processing
// Student Starter Code

// ======== 1. Accumulator Pattern ========

// Calculate sum of elements at even indices (0, 2, 4, etc.)
int sumEvenIndices(int[] arr) {
  // YOUR CODE HERE
  
  return 0; // Replace with your actual return value
}

// ======== 2. Min, Max, Search Algorithms ========

// Find the second-largest value in the array
int findSecondLargest(int[] arr) {
  // YOUR CODE HERE
  
  return 0; // Replace with your actual return value
}

// Linear search - find index of target or return -1 if not found
int linearSearch(int[] arr, int target) {
  // YOUR CODE HERE
  
  return -1; // Replace with your actual return value
}

// ======== 3. Test Property ========

// Check if array is sorted in ascending order
boolean isSorted(int[] arr) {
  // YOUR CODE HERE
  
  return false; // Replace with your actual return value
}

// ======== 4. Pairs and Duplicates ========

// Check if array has consecutive duplicate values
boolean hasConsecutiveDuplicates(int[] arr) {
  // YOUR CODE HERE
  
  return false; // Replace with your actual return value
}

// Count pairs where one element is double the other
int countDoubleAdjacentPairs(int[] arr) {
  // YOUR CODE HERE
  
  return 0; // Replace with your actual return value
}

// ======== 5. Rotating Array Elements ========

// Rotate elements right by k positions
void rotateRightByK(int[] arr, int k) {
  // YOUR CODE HERE
}

// ======== 6. Reversing an Array ========

// Reverse a section of an array (from index start to index end inclusive)
void reverseSection(int[] arr, int start, int end) {
  // YOUR CODE HERE
}

// ======== Challenge Problem ========

// Rearrange array so all even numbers come before all odd numbers
// while maintaining relative order within even and odd groups
void rearrangeEvenOdd(int[] arr) {
  // YOUR CODE HERE
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
