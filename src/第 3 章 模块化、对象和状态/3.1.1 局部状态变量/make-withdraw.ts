export {};

function createWithdraw(balance: number) {
  const withdraw = (amount: number) => {
    if (balance >= amount) {
      balance -= amount;
      return balance;
    }
    return 'Insufficient funds'
  }
  return withdraw;
}

const w1 = createWithdraw(99);

console.log(w1(10))
console.log(w1(10))
console.log(w1(10))
console.log(w1(100))
