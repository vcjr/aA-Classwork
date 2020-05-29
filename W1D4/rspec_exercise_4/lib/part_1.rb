def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
    results = []
    count = 0
    arr.each { |ele| results << prc.call(ele) }

    results.each do |result|
        count += 1 if result == true
        return false if count > 1
    end

    return true if count == 1
    false
end

def hash_select(hash, &prc)
    hash.reject { |k, v| !prc.call(k, v) }
end

def xor_select(arr, prc1, prc2)
    arr.select { |ele| !(prc1.call(ele) && prc2.call(ele)) && (prc1.call(ele) || prc2.call(ele)) }
end

def proc_count(val, arr)
    arr.count { |procs| procs.call(val) }
end
