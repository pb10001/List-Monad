--HaskellのListモナド

list1 = return 1 ::[Int]
list2 = [1, 2, 3]
list3 = [1 .. 10]

increment::Int->Int
increment x = x + 1

under::Int->[Int]->[Int]
under x ys = [y|y<-ys,y<x]

under5::[Int]->[Int]
under5 ys = under 5 ys

double::Int->[Int]
double x = [x, x]

sum'::[Int]->Int->Int
sum' []     x = x
sum' (x:xs) y = sum' xs (x+y)

sum''::[Int]->Int
sum'' xs = sum' xs 0

main = do
	print list1              	--[1]
	print list2              	--[1,2,3]
	print list3              	--[1,2,3,4,5,6,7,8,9,10]
	print $ list1 >>= double 	--[1,1]
	print $ list2 >>= double 	--[1,1,2,2,3,3]
	print $ under5 list3     	--[1,2,3,4]
	print $ sum'' list2      	--6
	print $ map increment list2 --[2,3,4]