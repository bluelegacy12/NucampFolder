my_list = [5, 4, 1, 2, 3]

def sort_part(list, low_idx, pivot_idx):
    pivot_val = list[pivot_idx]

    while pivot_idx != low_idx:
        low_val = list[low_idx]
        print(list, low_val, pivot_val)

        if low_val <= pivot_val:
            low_idx += 1
        else:
            list[low_idx] = list[pivot_idx - 1]
            list[pivot_idx] = low_val
            list[pivot_idx - 1] = pivot_val
            pivot_idx -= 1

    return pivot_idx

def quicksort(list, low_idx, high_idx):
    if low_idx > high_idx:
        return
    
    pivot_idx = sort_part(list, low_idx, high_idx)
    # pivot index stops after checking everything on the left side - but does not check if items moved are in order, just that the left idx is lower than the right - returns idx of 2
    quicksort(list, low_idx, pivot_idx - 1)
    # first quicksort checks idx 0 and pivot idx - 1 which is 1. The left idx is greater than the right so they go thru the sort method - returns idx of 0, but this is not used
    quicksort(list, pivot_idx + 1, high_idx)
    # second quicksort checks the pivot idx + 1, which was established on line 24 as 2 so it is now idx 3. This is compared with the high idx of 4, both are in order so process ends

quicksort(my_list, 0, len(my_list) - 1)
print(my_list)