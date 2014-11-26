# TODO: Add comment
# 
# Author: pawel
###############################################################################


#write.table(data, file = "/home/pawel/git/neuralnet/src/NeuralNet/exercises/module5/input.txt", sep = ",", row.names = FALSE, col.names = FALSE)

write.table(iris[,c(1,2,3,4)],"/home/pawel/git/neuralnet/src/NeuralNet/exercises/module5/iris.data.txt",sep=",",row.names=F,col.names=F)

runLua <- function(script,data = NULL){
	dataCsv=""
	#if there is data frame to pass to lua then built a CSV string so it can be passed as stdin
	if(!is.null(data)){
		rm(dataCsv)
		dataCsv.con <- textConnection("dataCsv", "w")
		write.csv(data, dataCsv.con,row.names=F)
		close(dataCsv.con)
		dataCsv  <- paste(dataCsv[2:length(dataCsv)],collapse = "\n")
	}
	#has to remove some character produced by bash prompt
	result <- gsub("\\\033\\[0m(\\\t)?","",system(paste("echo -e '",dataCsv,"' | th ",neuralNetProjectLocation,"/src/NeuralNet/exercises/",script,sep=""),intern = T))
	
	#translate result to data frame    
	return(result)  
}

runLua("module5/trainLattice.lua -d 4 -w -e 1000 -s 1 -l 0.1 -t 10 -n '5,5' -r 100 -o '{name=\"mex_hat\",beta=0.1,alpha=0.2}'",iris[,c(1,2,3,4)])