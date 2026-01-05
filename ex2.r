# Question 1

wages = c(900, 1000,1100,1200,1300,1400,1500)
num_employees = c(12, 13, 14, 13, 14, 11, 5)
x = data.frame(wages, num_employees)
mean_data = sum(x$wages*x$num_employees)/sum(x$num_employees)

full_data = rep(wages, num_employees)
median_data = median(full_data)

freq_table = table(full_data)
mode_data = names(freq_table)[freq_table == max(freq_table)]
mode_data = as.numeric(mode_data)


ord = order(wages)
f = num_employees[ord]

# Question 2 NEED TO FIX THIS

wages_mid = c(155, 165, 175, 185, 195)
num_workers = c(5, 8, 15, 10, 2)
mean_2 = sum(wages_mid*num_workers)/sum(num_workers)
full_data2 = rep(wages_mid, num_workers)
median_2 = median(full_data2)



# Question 3 Find quartile deviation

X = seq(20,28)
f  = c(8,10,11,16,20,25,15,9,6)
full_data3 = rep(X, f)
s = summary(full_data3)
q1 = s[["1st Qu."]]
q3 = s[["3rd Qu."]]
qd = (q3-q1)/2
qd_easy = IQR(full_data3)/2


# Question 4: Find quartile deviation of continuous data
size_mid = seq(61, 73, 3)
f = c(5, 18, 42, 27, 8)
lowers = seq(59.5, 71.5, 3)
N = sum(f)
cf = cumsum(f)
h = 3


idx1 = which(cf >= N/4)[1]
idx3 = which(cf >= 3*N/4)[1]
L1 = lowers[idx1]
L3 = lowers[idx3]
cf_prev1 =  if(idx1 == 1) 0 else cf[idx1 - 1]
f1 =  f[idx1]
cf_prev3 = if(idx3 == 1) 0 else cf[idx3 - 1]
f3 = f[idx3]
q1 = L1 + ((N/4 - cf_prev1)/f1)*h
q3 = L3 + ((3*N/4 - cf_prev3)/f3) * h

qd = (q3-q1)/2
cqd = (q3 - q1)/(q3 + q1)
l_min = lowers[1]
l_max =  lowers[length(lowers)] + h
range = l_max - l_min
range_coeff = range/(l_max  + l_min)

