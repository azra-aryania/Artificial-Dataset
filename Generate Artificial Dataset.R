Sys.setenv(JAVA_HOME="Enter the full path of your JAVA_HOME variable")
library("xlsx")
library(WriteXLS)
library("matrixcalc")
library(BBmisc)



p <- c(-1,-0.75,-0.5,-0.3,0,0.3,0.5,0.75,1)
q <- c(-1,-0.75,-0.5,-0.3,0,0.3,0.5,0.75,1)
r <- c(-1,-0.75,-0.5,-0.3,0,0.3,0.5,0.75,1)
s <- c(-1,-0.75,-0.5,-0.3,0,0.3,0.5,0.75,1)
t <- c(-1,-0.75,-0.5,-0.3,0,0.3,0.5,0.75,1)
u <- c(-1,-0.75,-0.5,-0.3,0,0.3,0.5,0.75,1)
scn_num <- 0

for (rho1 in p){
  for (rho2 in q){
    for (rho3 in r){
      for (rho4 in s){
        for (rho5 in t){
          for (rho6 in u){
              R<-matrix(c(1,rho1,rho2,rho3, rho1,1,rho4,rho5, rho2,rho4,1,rho6, rho3,rho5,rho6,1),4,4)
              if (is.positive.definite(R)){
                scn_num <- scn_num +1
                
                dat<-matrix(runif(4*6, min=0, max=1),4,6)
                ch<-chol(R)
                dat2 <- t(ch) %*%dat
                mydataset <- t(dat2)
                cor(mydataset , method = "pearson")
                
                mydataset_1 <- mydataset[,1]
                X1<-normalize(mydataset_1, method = "range", range = c(0, 1))
                
                mydataset_2 <- mydataset[,2]
                X2<-normalize(mydataset_2, method = "range", range = c(0, 1))
                
                mydataset_3 <- mydataset[,3]
                X3<-normalize(mydataset_3, method = "range", range = c(0, 1))
                
                mydataset_4 <- mydataset[,4]
                X4<-normalize(mydataset_4, method = "range", range = c(0, 1))
                
                new_dataset <- cbind(c(scn_num,scn_num,scn_num,scn_num,scn_num,scn_num),X1,X2,X3,X4)
                
                cor(new_dataset , method = "pearson")
                
                # Write the data set in a file
                
                mydataset_df <- as.data.frame(new_dataset)
                write.table(round(mydataset_df,4) , "Enter the full path of your destination file", sep=",", col.names=FALSE,append = TRUE)
              
              }
            
          }
        } 
      }
    }
  }
}

