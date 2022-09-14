#= 功能说明

a = u8[n] 定义数组 @u8[6]

a = :(1 | 2 | 3 | 6 | 9),10 数组赋值

say "hello world" 实现输出

a[1 | 2] = 6 数组赋值

say cyber 72 | 101 | 108 | 108 | 111 ASCII转字符串

=#

using Parsers

"""
通过宏实现u8
传入一个参数，生成向量
多个参数，取前两个生成矩阵
"""
macro u8(arg)
    if !all(typeof(eval(arg)) .!= Int)
        error("输入错误")
    elseif length(eval(arg)) == 1
        return :(zeros($arg[1]))
    else
        return :(zeros($arg[1], $arg[2]))
    end
end

macro say(content)
    return :(println($content))
end

macro cyber(arg)
    str = deletePar(string(arg))[2:end]
    nums = parse.(Int, split(str, "|"))
    chars = Char.(nums)

    tmp = ""
    for x in chars
        tmp *= x
    end

    # return :(println($tmp))
    return tmp
end

"""
删除表达式中自动形成的括号
"""
deletePar(str::String) = str[[x for x in 1:length(str) if str[x] ∉ ['(', ')', ' ']]]

# exp表示下标，必须为Int
function evaluate(arr, exp, value)
    if !(typeof(arr) <: Array) ||
       typeof(exp) != Expr ||
       !(typeof(value) <: Number)
        error("输入错误")
    else
        str = deletePar(string(exp))
        index = parse.(Int, split(str, "|"))
        arr[index] .= value
        return arr
    end
end

# 测试代码
begin
    a = @u8[10]
    @say a

    evaluate(a, :(1 | 4 | 7 | 10), 5)
    @say a

    @cyber :(72 | 101 | 108 | 108 | 111)
    @say @cyber :(72 | 101 | 108 | 108 | 111)
end
