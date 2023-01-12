# Move Zeros

# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative
# order of the non-zero elements.

# Example:

# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]

# Example Input: [0,0,11,2,3,4]
# Example Output: [11,2,3,4,0,0]

def movezero(li):
    li2 = []
    for number in li:
        if number == 0:
            li2.append(number)
    for number in li2:
        li.remove(0)
        li.append(number)
    return li
list2 = [0,0,11,2,3,4]
print(movezero(list2))