arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
p arr.map.with_index { |hash, idx| hash.each { |key, _| arr[idx][key] += 1 } }
