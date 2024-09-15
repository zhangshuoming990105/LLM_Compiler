very_simple = [4, 11, 13, 14, 15, 17, 18, 21, 22, 24, 28, 29, 31, 35, 36, 37, 41, 43, 48, 52, 58, 61, 62, 64, 65, 68, 69, 72, 75, 77, 79, 82, 89, 91, 96, 97, 99] 
simple = [8, 27, 57, 63, 70, 71, 81, 83, 85, 90, 94]

# all = [0-99]
all = list(range(100))
complex = list(set(all) - set(simple) - set(very_simple))
print("sizeof(all): ", len(all))
print("sizeof(simple): ", len(simple))
print("sizeof(very_simple): ", len(very_simple))
print("sizeof(complex): ", len(complex))

failed_CoT = [7,9,32,33,51,60,76,78,86,88,89,98]
failed_naive = [1, 2, 5, 9, 16, 20, 25, 30, 32, 34, 38, 40, 42, 56, 60, 73, 76, 78, 84, 87, 88, 92, 93, 95, 98]
passed = list(set(all) - set(failed_CoT))
passed_naive = list(set(all) - set(failed_naive))

# compute pass rate on all  
pass_rate = len(passed)*100.0 / len(all)
print("Pass rate on all(CoT): %.2f%%" % pass_rate)
# compute pass rate on simple
simple_passed = list(set(simple) & set(passed))
simple_pass_rate = len(simple_passed)*100.0 / len(simple)
print("Pass rate on simple(CoT): %.2f%%" % simple_pass_rate)

# compute pass rate on very simple
very_simple_passed = list(set(very_simple) & set(passed))
very_simple_pass_rate = len(very_simple_passed)*100.0 / len(very_simple)
print("Pass rate on very simple(CoT): %.2f%%" % very_simple_pass_rate)

# compute pass rate on complex
complex_passed = list(set(complex) & set(passed))
complex_pass_rate = len(complex_passed)*100.0 / len(complex)
print("Pass rate on complex(CoT): %.2f%%" % complex_pass_rate)

# compute pass_naive rate on all
pass_naive_rate = len(passed_naive)*100.0 / len(all)
print("Pass rate on all (naive): %.2f%%" % pass_naive_rate)

# compute pass_naive rate on simple
simple_passed_naive = list(set(simple) & set(passed_naive))
simple_pass_rate_naive = len(simple_passed_naive)*100.0 / len(simple)
print("Pass rate on simple (naive): %.2f%%" % simple_pass_rate_naive)


# compute pass_naive rate on very simple
very_simple_passed_naive = list(set(very_simple) & set(passed_naive))
very_simple_pass_rate_naive = len(very_simple_passed_naive)*100.0 / len(very_simple)
print("Pass rate on very simple (naive): %.2f%%" % very_simple_pass_rate_naive)

# compute pass_naive rate on complex
complex_passed_naive = list(set(complex) & set(passed_naive))
complex_pass_rate_naive = len(complex_passed_naive)*100.0 / len(complex)
print("Pass rate on complex (naive): %.2f%%" % complex_pass_rate_naive)

# the different between very simple and passed
common = list(set(very_simple) - set(passed))
print("The different between very simple and passed: ", common)
