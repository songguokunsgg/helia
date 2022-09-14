# helia——基于Julia的Helang介绍

## 定义数组和矩阵
在Julia语言中，我们使用 
```julia
arg = zeros(68)
arg = ones(68)
arg = rand(68)
```
等函数创建向量，而在helia中，我们使用
```julia
arg = @u8[68]
```
创建向量,可以添加空格
```julia
arg = @u8 [68]
```
```julia
marg = @u8[68,n]
```
创建矩阵，可以传入更多的参数，但只使用前两个数作为矩阵参数

## 打印数组和矩阵

在Julia语言中，我们使用print和println函数进行变量输出

```julia
julia> arg = [1,2,3];
julia> println(arg)
[1, 2, 3]
```

而在helia中，我们使用了更酷的方式进行输出
```julia
julia> @say arg
1 | 2 | 3
```
对于矩阵，也同样可以以这样的方式输出
```julia
julia> m = rand(3,2);

julia> @say m
0.015055729337118184 | 0.7642214578614951
0.8253252971463216 | 0.1133062228785976
0.1742849448735383 | 0.20650212425803915
```

## 数组的赋值
在Julia语言中，我们使用以下方式进行数组赋值
```julia
julia> arg = zeros(68);

julia> arg[[1,2,3]] .= 5;

julia> arg
68-element Vector{Float64}:
 5.0
 5.0
 5.0
 0.0
 ⋮
```
我们不得不面对一个非常尴尬的事实，那就是，这种赋值方式对本人来说太过丑陋，相信helia的赋值方式能对这个世界有一定意义。
```julia
julia> forceCon = @u8[68];

julia> evaluate(forceCon, :(1 | 2 | 6 | 7 | 11 | 52 | 57 | 58 | 65), 10)
68-element Vector{Float64}:
 5.0
 5.0
 0.0
 0.0
 ⋮
```

## cyber 简介
你还在用繁琐的方式转换字符和ASCII码吗?helia提供了一种十分赛博的方式。在过去，我们使用这样的方式转换
```julia
julia> nums = [72,68,99]
julia> chars = Char.(nums)
julia> for char in chars
    print(char)
end
HDc
```
而现在，我们使用 " | " 运算符进行转换
```julia
julia> @cyber :(25105 | 26159 | 72 | 101 | 108 | 105 | 97 | 35821 | 35328 | 33)
"我是Helia语言!"
```
cyber 返回一个字符串，因此可以与say一起使用
```julia
julia> @say @cyber :(72 | 101 | 108 | 108 | 111 | 44 | 119 | 111 | 114 | 108 | 100 | 33)
Hello,world!
```
不觉得这很酷吗!!