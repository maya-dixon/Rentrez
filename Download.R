library(dplyr)
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
# This is assigning the ID names of each of the 3 sequences to a variable called ncbi_ids
library(rentrez)  # you may need install.packages first
# This is loadign the rentrez package into the r script
Bburg <-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
# entrez_fetch allows you to retried full data from the NCBI database, db is the database name, id are the unique id's within the object and rettype allows your to specify how you would like the sequence formatted.

print(Bburg)

head(Bburg)

str(Bburg)

#Use the strsplit() function on the Bburg object to create a new object

Sequences <- strsplit(Bburg, split = "\n\n") #splitting the sequences
print(Sequences)

Sequences<-unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) 
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
print(Sequences)

#Now remove the newline characters from the Sequences data frame using regular expressions

xnewline <- gsub("\\n","",seq)

Sequences <- data.frame(Name = header, Sequence = xnewline)

# Sequences <- data.frame(Name = header, Sequence = xnewline)

write.csv(Sequences, "~/Desktop/SCHOOL/BIOL 432/Sequences.csv")
 

















