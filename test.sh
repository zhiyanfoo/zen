test_f() {
    echo pas ${@:3}
}
x=$(basename $0)
echo $x
basename $0

test_f 1 2 3 4 5
