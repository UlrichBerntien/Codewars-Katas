def one_punch(item): return " ".join(sorted(item.split())).translate(str.maketrans("","","AEae")) if isinstance(item,str) and len(item)>0 else "Broken!"
