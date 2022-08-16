microbial_growth<-read.table("https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/mcb/microbial_stationary_phase.dat",header=TRUE)
head(microbial_growth)
View(microbial_growth)

my_list<-c()
for (j in 2:13){
  slope<-c()
  
  for(i in 1:54){
    s<-((microbial_growth[i+1,j] - microbial_growth[i,j])/(microbial_growth[i+1,1]-microbial_growth[i,1]))
    slope<-c(slope,s)
    #print(slope)
  }
  
  #v<-slope[which.max(slope)]
  #print(v)
  new<-data.frame()
  T<-c()
  S<-c()
  #print(typeof(v))
  
  for(t in which.max(slope):53){
    #print(typeof(slope[t]))
    if (slope[t] < slope[which.max(slope)]){
      T<-c(T,t)
      #print(slope[t])
      S<-c(S,slope[t])
      new<-data.frame(S,T)
    } 
  }
  
  #print(j)
  microbial_growth[new[which.min(S),2],1]
  my_list<-c(my_list,microbial_growth[new[which.min(S),2],1])
}
my_list

#Here, my_list gives the set of time points for 
#each of the 12 samples of the dataset respectively.

#Therefore, all the 12 samples (A1 to A12) enter stationary phase at 11.86028


