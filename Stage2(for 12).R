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
  
  
  sub_slopes <- slope[which.max(slope):length(slope)]
    x <- (which.min(abs(sub_slopes-0)) + (length(slope) - length(sub_slopes)))
    
    print(file[x,1])
  
    my_list<-c(my_list,file[x,1])
}
my_list
#Here, my_list gives the set of time points for 
#each of the 12 samples of the dataset respectively.

#Therefore, all the 12 samples (A1 to A12) enter stationary phase at 11.86028

colnames(file)
file_dup<-file[,2:13]
colnames(file_dup)

sample_names<-colnames(file_dup)
Entry_time<-my_list

results_table<-data.frame(sample_names,Entry_time)
View(results_table)
write.csv(results_table,"results_table.csv")



#Here, my_list gives the set of time points for 
#each of the 12 samples of the dataset respectively.

#Therefore, all the 12 samples (A1 to A12) enter stationary phase at 11.86028


