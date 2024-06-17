# simple stack allocation for variables
# supported arch: x86_64, armv8a, riscv64

"""
Generic stack allocator.
Allocate stack space for variables.
Input: variable type info, using "name:type" format, separated by line
Extra: do we need save sp fp ra?(depends on calling convention and function body)
Output: stack offset for each variable, in the order of input
Algorithm:
1. Parse input variable type info, put them in list
2. based on variable type, calculate stack offset
3. based on type alignment, align stack offset
4. return allocated stack offset for each variable
"""

class StackAllocator():
    def __init__(self, arch):
        self.arch = arch
        
        
    # parse input variable type info, put them in list
    def parse(self, input):
        pass
    
    # return allocated stack offset for each variable
    def allocate(self):
        output: str = ""
        return output
    

"""
return x86 style variable stack offset, e,g, -8(%rbp)
"""
class X86StackAllocator(StackAllocator):
    def __init__(self):
        super().__init__("x86_64")

    def allocate(self):
        output: str = ""
        return output

    
"""
return arm style variable stack offset, e,g, [sp, #80]
"""
class ArmStackAllocator(StackAllocator):
    def __init__(self):
        super().__init__("armv8a")
        
"""
return riscv style variable stack offset, e,g, 88(sp)
"""
class RiscvStackAllocator(StackAllocator):
    def __init__(self):
        super().__init__("riscv64")