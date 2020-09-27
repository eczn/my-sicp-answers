
// 判断 n 是不是偶数 
const even = n => (n % 2) === 0;

// 递推关系
const A = n => {
    if (n === 1) {
        return 2;
    } else {
        if (n % 2 === 0) {
            return A(n / 2) - 1
        } else {
            return 2 * A((n - 1) / 2) + 1;
        }
    }
}

// 数列求和
const sum_for_a = (START, END) => {
    const NOW_VAL = A(START);
    if (START === END) {
        return NOW_VAL
    } else {
        return NOW_VAL + sum_for_a(START + 1, END);
    }
}

console.log(sum_for_a(1, 63));
