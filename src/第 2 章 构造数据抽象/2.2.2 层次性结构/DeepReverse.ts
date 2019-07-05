export function deepReverse(list: any[]) {
    return list.slice().reverse().map(
        subList =>
            Array.isArray(subList) ? 
                deepReverse(subList) : 
                subList
    )
}

deepReverse([[1, 2], [3, 4]]);
// => [[4, 3], [2, 1]]
