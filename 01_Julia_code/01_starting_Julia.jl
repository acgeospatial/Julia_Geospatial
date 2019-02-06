
println("Hello World")

print("Hello World")

print("Hello World")
print("Hello Geospatial Julia")

println("Hello World")
println("Hello Geospatial Julia")

## learning about for loops
x = 1,2,3
println(length(x))

println(typeof(x))

for i = 1:length(x)
  println(x[i])
end

y = [1,2,3]
println(length(y))

println(typeof(y))

for i = 1:length(y)
  println(y[i])
end

for i = 1:3
  println(i)
end

z = 0
while z<10
    println(z)
    z+=1 # z = z + 1 (reminder)
end

function f(a)
  a+10  
end 

f(10)

f2(a,b) = a+b 

f2(10,20)

k = 25:50
println(k)
println(typeof(k))


for i = k
  println(i)
end
