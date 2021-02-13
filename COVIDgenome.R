COVIDseq <-read.csv("./COVID sequence.csv")
nchar(COVIDseq, type = "chars")
#there are 31,602 characters in the sequence and we are looking for S protein which starts at character 21,563 and ends at character 25,384
Sprotein <- substr(COVIDseq, 21563, 25384)
#Would you say this gene is highly conserved or evolving rapidly? Why?  Explain this in a comment at the end of your second script.
#I would say that based of the data from my BLAST search is highly conserved because percent identity section is quite close to 100% and there are many matches which leads me to believe that it is highly conserved.