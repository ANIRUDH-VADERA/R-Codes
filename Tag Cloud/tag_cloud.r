library("tm") #For text mining
library("SnowballC")# For text stemming
library("wordcloud")# For word-cloud generation
library("RColorBrewer")#For color palettes
library("ggplot2")#For plotting graphs
getwd()
#Reading the text from a local file
text <- readLines(file.choose())
text

#Loading the data as a corpus
TextDoc <- Corpus(VectorSource(text))
print(TextDoc[1])

#Replacing "/" , "@" and "|" with space
toSpace <- content_transformer(function(x,pattern) gsub(pattern,"",x))
TextDoc <- tm_map(TextDoc,toSpace,"/")
TextDoc <- tm_map(TextDoc,toSpace,"@")
TextDoc <- tm_map(TextDoc,toSpace,"\\|")
TextDoc

#Convert to lower case
TextDoc <- tm_map(TextDoc,content_transformer(tolower))

#Remove numbers 
TextDoc <- tm_map(TextDoc,removeNumbers)

#Remove Punctuation
TextDoc <- tm_map(TextDoc,removePunctuation)

#Eliminate extra white spaces 
TextDoc <- tm_map(TextDoc,stripWhitespace)

#Build a term-Document Matrix
TextDoc_dtm <- TermDocumentMatrix(TextDoc)
dtm_m <- as.matrix(TextDoc_dtm)
head(dtm_m)

#Sort by decreasing value of frequency
dtm_v <- sort(rowSums(dtm_m),decreasing = TRUE)
head(dtm_v)
dtm_d <- data.frame(word=names(dtm_v),freq=dtm_v)

#Display the top 5 most frequent words
head(dtm_d,10)

#plot the most frequent words
barplot(dtm_d[1:5,]$freq , las=1,names.arg = dtm_d[1:5,]$word, col="lightgreen",main="Top 5 most frequent words",ylab="Word Frequencies" )

#Generate the cloud
wordcloud(words = dtm_d$word , freq=dtm_d$freq,min.freq=5,max.words=100,random.order=FALSE,rot.per=0.90,colors=brewer.pal(8,"Dark2"))

#Find associations
findAssocs(TextDoc_dtm,terms = c("good","work","health"),corlimit=0.25)