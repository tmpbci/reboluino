/*
 Send and execute Commands
 
 Switch on/off LED 13 at beginning
 Reads a serial input string until it sees a newline, then search for
 a known command and execute it
 
 Light LED 13 at beginning
 
 */

String inString = "";    // string to hold input

void setup() {
  // Initialize serial communications:
  Serial.begin(9600);
  pinMode(13, OUTPUT); 
  digitalWrite(13, HIGH);   // set the LED on
  delay(1000);   
  digitalWrite(13, LOW);    // set the LED off
  delay(1000);   
}

void loop() {
  // Read serial input:
  while (Serial.available() > 0) {
    int inChar = Serial.read();
  
      // convert the incoming byte to a char 
      // and add it to the string:
      inString += (char)inChar; 
   
     
      // clear the string for new input:
      if (inString == "ON") {
                         /* Serial.print("String: ");
                         Serial.println(inString); */
                        digitalWrite(13, HIGH);   // set the LED on
                          inString = ""; 
      } 
      if (inString == "OFF") {  
                        /* Serial.print("String: ");
                         Serial.println(inString); */
                        digitalWrite(13, LOW);    // set the LED off
                          inString = ""; 
      } 
    
    
  }
}




