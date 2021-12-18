def check_exam(arr1,arr2):
    def points(corr,stud):
        if stud == corr:
            return 4
        elif stud:
            return -1
        else:
            return 0
    return max(0, sum(points(*it) for it in zip(arr1,arr2)))
  
