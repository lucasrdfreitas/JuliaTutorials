
# ------------------------------------------------------------------------------------------
# # Julia 中的线性代数
# > Based on work by Andreas Noack Jensen (MIT) (http://www.econ.ku.dk/phdstudent/noack/)
# > with edits from Jane Herriman
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ## 基础线性代数操作
# 定义一个随机矩阵
# ------------------------------------------------------------------------------------------

A = rand(1:4,3,3)

# ------------------------------------------------------------------------------------------
# 定义一个元素全为 1 的向量
# ------------------------------------------------------------------------------------------

x = fill(1.0, (3,)) # = fill(1.0, 3)

# ------------------------------------------------------------------------------------------
# 注意 $A$ 的类型为 `Array{Int64,2}`，而 $x$ 的类型为 `Array{Float64,1}`。
#
# Julia 定义向量 `Vector{Type}` 的别名为 `Array{Type,1}`，矩阵`Matrix{Type}` 的别名为 `Array{Type,2}`。
#
# 许多线性代数的基础操作和其他语言一样
#
# ### 乘法
# ------------------------------------------------------------------------------------------

b = A*x

# ------------------------------------------------------------------------------------------
# ### 转置
# 就像在其他语言中 `A'` 表示对 `A` 进行共轭转置
# ------------------------------------------------------------------------------------------

A'

# ------------------------------------------------------------------------------------------
# 我们还可以通过 `transpose` 函数获得转置矩阵
# ------------------------------------------------------------------------------------------

transpose(A)

# ------------------------------------------------------------------------------------------
# ### 转置的乘法
# Julia 中某些情况下可以省略 `*` 号
# ------------------------------------------------------------------------------------------

A'A

# ------------------------------------------------------------------------------------------
# ### 解线性方程组
# 用方阵 $A$ 表示的线性方程组 $Ax=b$ 可以用左除运算符（函数）`\` 求解
# ------------------------------------------------------------------------------------------

A\b

# ------------------------------------------------------------------------------------------
# 超定线性方程组（overdetermined linear system）的情况下 `A\b` 给出*最小二乘解（least squares solution）*
# ------------------------------------------------------------------------------------------

Atall = rand(3, 2)

Atall\b

# ------------------------------------------------------------------------------------------
# 缺秩最小二乘问题（a rank-deficient least squares problem）情况下，会给出*极小范数最小二乘解（minimum norm least
# squares solution）*
# ------------------------------------------------------------------------------------------

v = rand(3)
rankdef = hcat(v, v)

rankdef\b

# ------------------------------------------------------------------------------------------
# 欠定问题（an underdetermined solution）下，会给出 最小范数解（minimum norm solution）
# ------------------------------------------------------------------------------------------

bshort = rand(2)
Ashort = rand(2, 3)

Ashort\bshort

# ------------------------------------------------------------------------------------------
# ## `LinearAlgebra` 包
#
# 如上所示，Julia默认自带了很多线性代数操作，而标准库 `LinearAlgebra` 提供了更多的相关名词和函数。
# 特别是它提供了因子分解和一些结构化矩阵类型。
# 和其他包一样，可以通过 `using LinearAlgebra` 引入这些额外的特征。
# ------------------------------------------------------------------------------------------

using LinearAlgebra

# ------------------------------------------------------------------------------------------
# ## 练习
#
# ### 10.1
# 计算向量 `v` 和它自己的内积，并赋值给 `dot_v`。
# ------------------------------------------------------------------------------------------

v = [1,2,3]

# 在此作答
dot_v = v

@assert dot_v == 14

# ------------------------------------------------------------------------------------------
# ### 10.2
# 计算向量 v 和它自己的外积(Outer product)，并赋值给 `outer_v`。
#
# 提示：外积是一种克罗内克积(Kronecker product)
#
# 计算叉积(cross product)，赋值给 `cross_v`
# ------------------------------------------------------------------------------------------

# 在此作答
outer_v = v
cross_v = v

@assert outer_v == [1 2 3
                    2 4 6
                    3 6 9]

@assert cross_v == [0, 0, 0]

# ------------------------------------------------------------------------------------------
# 请在完成练习运行 `@assert` 块以检测结果是否正确，若无报错即为正确。
# ------------------------------------------------------------------------------------------
