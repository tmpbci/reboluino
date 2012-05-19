REBOL [ Title: "Reboluino" 
	author: Sam Neurohack
	note: 
	Version: 0.3
]
system/ports/serial: [cu.usbmodemfd1421]
Command1: "ON"
Command2: "OFF"
buffer: make string! 100
controllers: layout [
	anti-alias on
	backdrop effect [gradient 1x1 0.0.0 50.50.50] 
	at 20x10 text "Reboluino" white
	at 20x35 status: info bold "reboluino" 220x25 font-color white 
;; Live recording buttons
	at 20x70 text "Live Play" snow  
	at 180x10 hgamval: text "0000" gray 
	at 130x10 hval: text "0000" gray       
	at 197x70 tcount: text "00000" snow
	at 155x70 tsignal: text "000" snow 
	at 100x95 button 70 50.50.50 edge [size: 1x1] "close" [
		status/font/color: snow
		status/text: "Ready"
		show status
		tcount/text: "000"
		show tcount
		close duino
		]
	at 180x95 button 70 50.50.50 edge [size: 1x1] "Quit" [quit]
	at 20x125 button 70 50.50.50 edge [size: 1x1] "Comm 1" [
   			insert duino Command1
    		]
  	at 100x125 button 70 50.50.50 edge [size: 1x1] "Comm 2" [
   			insert duino Command2
    		]
  
		
	at 20x95 button 70 50.50.50 edge [size: 1x1] "open" [
		duino: open/no-wait serial://port1/9600/8/none/1
		Print "Activating Device ..."
		;wait [duino 0:00:5]
		]
]


print "Connecting...."
view/new controllers
do-events