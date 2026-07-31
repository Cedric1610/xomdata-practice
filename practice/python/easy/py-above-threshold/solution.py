# Xom Data · Count students above the benchmark
# Problem: https://xomdata.com/practice/py-above-threshold
# Solved: 2026-07-31

def count_above(numbers, threshold):
    count = 0
    for num in numbers:
        
        if num > threshold:
            count += 1

    return count
