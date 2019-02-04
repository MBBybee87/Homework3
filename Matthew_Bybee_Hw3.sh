function getHelp(){
	echo "Help has arrived!"
	echo "This file will run automatically, checking if the fredData/MM directory structure exists on the machine this is currently running on and moving the FRED.csv file from hvalle's account without issue, assuming the SSH keys are set up correctly."
}
if [ "$1" == "--help" ]
then
	getHelp
	exit 1
fi

if [ ! -d "$HOME/fredData/12" ]
then
	echo "Directory fredData doesn't exist."
	echo "Creating..."
	mkdir -p $HOME/fredData/{01,02,03,04,05,06,07,08,09,10,11,12}
else
	echo "Directory feedData exists!"
fi

echo "Retreiving csv file from customer server..."

scp mb64429@137.190.19.20:/home/hvalle/submit/cs3030/files/FRED.csv $HOME/fredData/$(date +%m)/FRED.csv.$(date +%Y-%m-%d)

if [ -f $HOME/fredData/$(date +%m)/FRED.csv.$(date +%Y-%m-%d) ]
then
	echo "File successfully transfered!"
	echo "File is located at [/fredData/$(date +%m)/FRED.csv.$(date +%Y-%m-%d)]"
else
	echo "Something went wrong..."
fi
