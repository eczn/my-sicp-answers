// Church 计数 JS 版

const inc = i => i + 1;

const zero = f => x => x;

const add1 = n => f => x => f(n(f)(x))

const one = f => x => f(x)
const two = f => x => f(f(x))

console.log(one(inc)(0));
console.log(two(inc)(0));

const add = (a, b) => f => x => a(f)( b(f)(x) );

const three =  add(one, two);
console.log(three(inc)(0));
