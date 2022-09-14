include("helia.jl")
# 测试代码
# u8 创建数组
forceCon = @u8[68]
# 用say输出
@say forceCon

# u8 创建矩阵
mforceCon = @u8[68, 4]
@say mforceCon
# 通过 | 运算赋值
evaluate(forceCon, :(1 | 2 | 6 | 7 | 11 | 52 | 57 | 58 | 65), 10)
@say forceCon

# cyber 将 | 表达式中ascii转字符串
@cyber :(25105 | 26159 | 72 | 101 | 108 | 105 | 97 | 35821 | 35328 | 33)
# say cyber 调用
@say @cyber :(72 | 101 | 108 | 108 | 111 | 44 | 119 | 111 | 114 | 108 | 100 | 33)
