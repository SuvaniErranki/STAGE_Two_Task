file<-read.delim("384wp_data.txt", header = TRUE, sep = "\t", dec = ".")
View(file)

#####In One Go
my_list<-c()
for (j in 2:385){
  slope<-c()
  
  for(i in 1:18){
    s<-((file[i+1,j] - file[i,j])/(file[i+1,1]-file[i,1]))
    slope<-c(slope,s)
    
  }
    v<-slope[which.max(slope)]
    #print(v)
    new<-data.frame()
    T<-c()
    S<-c()
    #print(typeof(v))
    
    for(t in which.max(slope):17){
       #print(typeof(slope[t]))
      if (slope[t]< v){
        T<-c(T,t)
        #print(slope[t])
        S<-c(S,slope[t])
        new<-data.frame(S,T)
      } #else {print("nothing")}
    }
  
  #print(j)
  file[new[which.min(S),2],1]
  my_list<-c(my_list,file[new[which.min(S),2],1])
}
my_list
