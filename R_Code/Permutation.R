RemoveOutliers <- function(df,column,min_quant=NA,max_quant=NA){
  ##remove values under the min_quant quantile value and above the max_quant quantile values for the column specified
  ## e.g. removerOutliers(df,0.01,0.99) removes the top and bottom 1% of observations for the column 
  ## e.g. removerOutliers(df,max_quant=0.99) removes the top 1% (but not bottom) of observations for the column 
  min_cut = unname(quantile(df[,column],min_quant))
  max_cut = unname(quantile(df[,column],max_quant))
  cut_df = df[df[column]>=min_cut & df[column]<=max_cut,]
  return(cut_df)
}

Permute_samples <- function(p,df,X){
  p<-sample(p,length(p),FALSE)
  in_sample_mean <- mean(df[p==1,X],na.rm=TRUE)
  out_sample_mean <- mean(df[p==0,X],na.rm=TRUE)
  return(in_sample_mean - out_sample_mean)
}

Permutation <- function(n,df1,c1,c2,w1,w2=NA,tail="R",plot=TRUE){
  #df1 is the source data frame
  #c1 is the column used for identifying the different groups
  #w1 and w2 are the two groups to compare (w1 is test group)
  #c2 is the column with the observed data
  #n is the number of samples
  #tail = R or L if we are using a one tailed test (right ot left), =T for a two tailed test (testing the effect one-way or two-way)
  df <- as.data.frame(df1) #makes sure the data is in a dataframe format
  D_null<-c() 
  V1<-df[,c1] 
  V2<-df[,c2]
  sub.value1 <- df[df[, c1] == w1, c2]
  
  m <- length(V1[V1==w1])
  if(!is.na(w2)){
     l <-length(V1[V1==w2])
     sub.value2 <- df[df[, c1] == w2, c2]
     df <- df[(df[, c1] == w1)|(df[, c1] == w2),]
  }
  else{
     l <-length(V1)-m
     sub.value2 <- df[df[, c1] != w1, c2]
  }
  if(tail=="R" | tail=="L"| tail=="T"){
    D_hyp <-  mean(sub.value1, na.rm=TRUE) - mean(sub.value2, na.rm=TRUE)
  }
  else{
    print("ERROR, tail should be R,L or T")+return(NA)
  }
  permutation_sample <- rep(0,m+l)
  permutation_sample[0:m]<-1 
  D_null<- replicate(n,Permute_samples(permutation_sample,df,c2))
  
  if(plot){
    sigma=sd(D_null)
    myhist<-hist(D_null/sigma,100, prob=TRUE)
    multiplier <- myhist$counts / myhist$density
    mydensity <- density(D_null/sigma, adjust=2)
    mydensity$y <- mydensity$y * multiplier[1]
    plot(myhist,xlab="Z-score",main="Permutation Test")
    lines(mydensity, col='blue')
   # print(D_hyp)
    abline(v=D_hyp/sigma, col='red')
  }
  
  left_side=FALSE
  if(tail=="T"){
    if(D_hyp<0) {
      left_side=TRUE
    }
  }
  if(tail=="R" | (tail=="T" & left_side==FALSE)) {
    M<-mean(D_null>D_hyp) #estimate the one-tailed p-value by counting how many times the permuted samples have a higher difference than our hypothesis
  }
  else{
    if (tail=="L" | (tail=="T" & left_side==TRUE)){
      M<-mean(D_null<D_hyp) #estimate the one-tailed p-value by counting how many times the permuted samples have a lower difference than our hypothesis
    }
  }
  #print(D_hyp)
  #print(sigma)
  #print(D_hyp/sigma)
  #print(D_null)
  return(M)
}