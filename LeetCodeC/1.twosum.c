#include <stdio.h>
#include <stdlib.h>

int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    // Allocate memory for the hash table
    int* hashTable = malloc(sizeof(int) * numsSize * 2);
    // Initialize hash table to -1
    for (int i = 0; i < numsSize * 2; ++i) {
        hashTable[i] = -1;
    }

    // Allocate memory for the result
    int* result = malloc(sizeof(int) * 2);
    *returnSize = 2;

    // Iterate over the array
    for (int i = 0; i < numsSize; ++i) {
        int complement = target - nums[i];
        int index = complement % (numsSize * 2);
        // Check if the complement is in the hash table
        if (hashTable[index] != -1) {
            result[0] = hashTable[index];
            result[1] = i;
            // Free the hash table before returning
            free(hashTable);
            return result;
        }
        // Insert the current element into the hash table
        hashTable[nums[i] % (numsSize * 2)] = i;
    }

    // Free the hash table if no solution is found
    free(hashTable);
    // If there is no solution, return NULL
    return NULL;
}