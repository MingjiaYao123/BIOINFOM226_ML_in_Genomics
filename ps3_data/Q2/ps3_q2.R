setwd("/Users/michaelyao/desktop/Bioinfo M226/ps3_data/Q2")

mix1_geno <- read.fwf("mixture1.geno.txt",widths = rep(1, 1000))
mix1_ <- read.fwf("mixture1.geno.txt",widths = rep(1, 1000))

#mixture1
ll1 <- c(-4946557.660070642, -2640862.0329081262, -2429180.164042054)
pi_list1 <- c(0.394, 0.606)

#accuray=0.64 for SNP10, accuray=0.99 for SNP100, accuray=1.00 for SNP1000,

#mixture 2
ll22 <- c(-4989040.165409159,-2613394.613045426,
        -2612747.8897362617,-2454791.9576821947)
pi_list22 <- c(0.224, 0.776)
#ll23: [-5016351.0559634045, -2590842.566084549, -2449315.873989708] k=3, pi_list23:[0.006, 0.77, 0.224]
#ll24: [-4942609.6865766505, -2605016.469979796]

#qa plot
iteration <- c(1,2,3)
log_likelihood <- c(-4946557.660070642, -2640862.0329081262, -2429180.164042054)
plot(x = iteration, y = log_likelihood, xlab = "Iteration", ylab = "log likelihood", type = "l")

#qe plot
SNP_num <- c(10,100,1000,5000)
accuracy <- c(0.64,0.99,1,1)
plot(x = SNP_num, y = accuracy, xlab = "# of SNP", ylab = "Accuracy", type = "l")

#qg plot
k <- c(1,2,3,4)
ll <- c(-4990114.384554308,-2454791.9576821947,-2449315.873989708,-2605016.469979796)
plot(x = k, y = ll, xlab = "K", ylab = "log likelihood", type = "l")


