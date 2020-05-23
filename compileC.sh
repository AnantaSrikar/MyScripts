function compile(){
	fullFileName=$1
	fileName=$(basename "$fullFileName")
	fName="${fileName%.*}"
	gcc $fullFileName -o $fName
	./$fName
}

function compileM(){
	fullFileName=$1
	fileName=$(basename "$fullFileName")
	fName="${fileName%.*}"
	gcc $fullFileName -o $fName -lm
	./$fName
}

#use compile as the name of the command
#source ./filename.sh in .bashrc