import os
import shutil


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


def workspace_clear(sandbox_dir, log_dir):
    # rm all the temp files in the sandbox
    if os.path.exists(sandbox_dir):
        for dir in os.listdir(sandbox_dir):
            if dir.startswith("temp_"):
                shutil.rmtree(os.path.join(sandbox_dir, dir))
    if os.path.exists(log_dir):
        for file in os.listdir(log_dir):
            if file.startswith("temp_"):
                os.remove(os.path.join(log_dir, file))
