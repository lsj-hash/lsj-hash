import os 

if not os.path.exists("test_dir"):
    os.mkdir("test_dir")

# os.makedirs("B/C/D")

os.removedirs("B/C/D")