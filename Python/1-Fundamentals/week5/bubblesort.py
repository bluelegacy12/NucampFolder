unsorted_list = [101, 49, 3, 12, 56]

def bubblesort(list):
    high_idx = len(list) - 1
    list_changed = False
    for i in range(high_idx):
        for j in range(high_idx):
            item = list[j]
            next = list[j + 1]

            if item > next:
                list[j] = next
                list[j + 1] = item
                list_changed = True

            print(list, i, j)
        print(list_changed)
        if list_changed == False:
            break

bubblesort(unsorted_list)