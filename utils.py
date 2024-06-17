import os

def get_env():
    cwd = os.getcwd()
    root_dir = cwd.split("LLM_Compiler")[0]
    os.chdir(root_dir)
    if os.path.exists("LLM_Compiler"):
        os.chdir("LLM_Compiler")
        root_dir = os.getcwd()
    else:
        root_dir = None
    return root_dir