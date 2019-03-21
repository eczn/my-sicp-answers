function sumOfBigger(a: number, b: number, c: number) {
    return (a <= b && a <= c) ? (
        // a 最小
        b + c
    ) : (
        // a 不是最小, 说明 a 是较大的数中的一个
        a + (
            b > c ? b : c
        )
    );
}



console.log(
    sumOfBigger(1, 2, 3), // 5
    sumOfBigger(2, 1, 3), // 5
    sumOfBigger(4, 5, 6), // 11
    sumOfBigger(4, 4, 4), // 8
    sumOfBigger(5, 4, 5)  // 10
);
