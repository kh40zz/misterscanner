#!/bin/bash

# Author: Kh40zz

# Colours
KGREN="\e[0;32m\033[1m"
KNMAL="\033[0m\e[0m"
KRED="\e[0;31m\033[1m"
KBLUE="\e[0;34m\033[1m"
KYLLW="\e[0;33m\033[1m"
KPRPL="\e[0;35m\033[1m"
KTQSE="\e[0;36m\033[1m"
KGRAY="\e[0;37m\033[1m"



# Make Ctrl + C
cancel(){

  echo -ne "\n\nGoodBye...\n"
  tput cnorm ;exit 1
}

# Capture Ctrl + C
trap cancel SIGINT

# Logo
logo(){
  printf " $KYLLW
                                                                  
                                    )                             
                            )      ((     (                      
                           (        ))     )                     
                    )       )      //     (                      
               _   (        __    (     ~->>                     
        ,----- '|__,_~~___<'__\`)-~__--__-~->> <                
        | //  : | -__   ~__ o)____)),__ - '> >-  >              
        | //  : |- \\_ \\ -\\_\\ -\\ \\ \\ ~\\_  \\ ->> - ,  >> 
        | //  : |_~_\\ -\\__\\ \\~'\\ \\ \\, \\__ . -<-  >>      
        \`-----._| \`  -__\`-- - ~~ -- \` --~> >               
         _/___\\_    //)_\`//  | ||]                           
   _____[_______]_[~~-_ (.L_/  ||                         
  [____________________]' \`\\_,/'/                     
    ||| /          |||  ,___,'./                      
    ||| \\          |||,'______|                     
    ||| /          /|| I==||                  
    ||| \\       __/_||  __||__                 
----|||-/------\`-._/||-o--o---o---~~~~~'
                                                               $KGREN  misterscanner.sh                                                    
                                                               $KRED    Author: Kh40z 
  $KNMAL"
}

# Help's Menu 
menu(){
  echo -ne "$KGREN\nmisterscanner.sh:\n\n$KBLUE Description:    A simple TCP port scanner\n\n\t$KPRPL RUN: $0 <IP_ADDR>\n\n$KNMAL"
}

# Make Scan
scan(){
 
  # Declare port range
  declare -a ports=( $(seq 1 36535) )

  # loop of any port of the port's
  for port in ports; do
    # scan the port
    (exec 3<> /dev/tcp/$1/$2 2>/dev/null);
  done

}

# flow of the program
logo
menu


