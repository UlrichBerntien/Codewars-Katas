function Get-EvenOrOdd ([int] $number) {
    if (($number -band 1) -eq 0) {
        'Even'
    } else {
        'Odd'
    }
}
