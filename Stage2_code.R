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
  
  
    sub_slopes <- slope[which.max(slope):length(slope)]
    posn <- (which.min(abs(sub_slopes-0)) + (length(slope) - length(sub_slopes)))
    
    print(file[posn,1])
  
    my_list<-c(my_list,file[posn,1])
}
my_list

colnames(file)
file_dup<-file[,2:385]
colnames(file_dup)

sample_names<-colnames(file_dup)
Entry_time<-my_list

results_table<-data.frame(sample_names,Entry_time)
View(results_table)
write.csv(results_table,"results_table.csv")
