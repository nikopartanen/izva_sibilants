# source https://gist.github.com/jhollist/6e296ad3f3b42f983d86

# word_count <- function(txt_doc){
#         con <- file(txt_doc, "r", blocking=FALSE)
#         x <- readLines(con)
#         #Remove YAML front matter on Rmd
#         if(length(grep("---",x))>0){x<-x[-seq(1,max(grep("---",x)))]}
#         x <- gsub("<!--.+-->", "", x)
#         wrds<-0
#         for(line in x){
#                 #Removes non character and splits
#                 split_line <- strsplit(gsub("[^[:alnum:] ]", "", line), " +")[[1]]
#                 #Removes empty string
#                 split_line <- split_line[split_line != ""]
#                 wrds <- wrds + length(split_line)
#         }
#         return(wrds)
# }

word_count <- function(txt_doc, target){
        con <- file(txt_doc, "r", blocking=FALSE)
        x <- readLines(con)
        #Remove YAML front matter on Rmd
        if(length(grep("---",x))>0){x<-x[-seq(1,max(grep("---",x)))]}
        x <- gsub("<!--.+-->", "", x)
        
        if (target == "prose") {
        
        x <- gsub("```.+```", "", x)
        
        }
        
        wrds<-0
        for(line in x){
                #Removes non character and splits
                split_line <- strsplit(gsub("[^[:alnum:] ]", "", line), " +")[[1]]
                #Removes empty string
                split_line <- split_line[split_line != ""]
                wrds <- wrds + length(split_line)
        }
        return(wrds)
}
