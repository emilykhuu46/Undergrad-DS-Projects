## Question 1

my_vector<-c(1,2,3,4,5)
my_vector

## Question 2

x<-rep(c(1,2),3)
x

# Question 3

seq_vector<-seq(from=5, to=15, by=2)
seq_vector

# Question 4

random_vector<-sample(rnorm(1000, mean=0, sd=1), 10)
random_vector

# Question 5

empty_vector<-c()
empty_vector
typeof(empty_vector)

# Question 6

orders<-c(10,20,30)
orders
names(orders)<-c("First", "Second", "Third")
orders

# Question 7

x<-c(1,3,5,7,9)
x

j=x[x>4]
j

# Question 8

x<-c(2,4,6,8)
x
sum(x)

prod(x)

# Question 9

a<-c(1,2,3)
b<-c(4,5,6)

sum_result<-a+b
sum_result

diff<-a-b
diff

prod<-a*b
prod

# Question 10

x<-c(1,2,3,4,5)
y<-c(5,4,3,2,1)

cor.test(x,y)

# Question 11

m<-matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)
m

# Question 12

rownames(m)<-c("Row1", "Row2", "Row3")
colnames(m)<-c("Col1", "Col2", "Col3")
m

# Question 13

second_row<-m[2, ]
second_row

# Question 14
a<-m()


Row4<-c(10,11,12)
new_m<-rbind(m, Row4)
new_m

alt_m<-new_m[-2, ]
alt_m

# Question 15

apply(m,2,sum)

# Question 16

A<-matrix(1:4, nrow=2)
B<-matrix(rep(2,4), nrow=2)

matrix_sum<-A+B
matrix_sum

matrix_prod<-A*B
matrix_prod

# Question 17

z<-c(1, NA, 3, NA, 5)
z2<-na.omit(z)
z2

z_mean<-mean(z2)
z_mean

z[is.na(z)]<-z_mean
z

# Question 18

M<-matrix(1:9, nrow=3)
M

J<-matrix(M[M>5],nrow=2)
J

# Question 19

M[M>5]<-0
M
