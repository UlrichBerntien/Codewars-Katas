package kata
import "container/list"

func int2list(n int64) *list.List {
    lst := list.New()
    for ok:=true; ok; ok=n>0 {
        lst.PushFront( n % 10 )
        n /= 10
    }
    return lst
}

func list2int(lst *list.List) int64 {
    accu := int64(0)
    for it:=lst.Front(); it != nil; it=it.Next() {
        accu = accu*10 + it.Value.(int64)
    }
    return accu
}

func MaxRot(n int64) int64 {
    maxValue := n
    lst := int2list(n)
    var next *list.Element
    for it:=lst.Front(); it != nil; it=next {
        next = it.Next()
        if( next != nil ) { next=next.Next() }
        lst.MoveToBack(it)
        value := list2int(lst)
        if value > maxValue { maxValue = value }
    }
    return maxValue
}