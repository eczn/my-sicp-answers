// 平方
const square = n => n * n;

// 判断偶数
const isEven = n => (n % 2 === 0);

// 迭代
const fastExptIter = (a, b, n) => {
    return n === 0 ?
        a : (
            isEven(n) ? 
                fastExptIter(a, b * b, n / 2) : 
                fastExptIter(a * b, b, n - 1)
        )
}

// 包装
const fastExpt = (b, n) => fastExptIter(1, b, n);

console.log(fastExpt(3, 0));
console.log(fastExpt(3, 1));
console.log(fastExpt(3, 2));
console.log(fastExpt(3, 3));
console.log(fastExpt(3, 4));
console.log(fastExpt(3, 5));
console.log(fastExpt(3, 6));
