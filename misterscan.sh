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


declare -a ports=$(seq 1 36535)

ip=$2


# Make Ctrl + C
cancel(){

  echo -ne "$KRED\n\nGoodBye...\n$KNMAL"
  tput cnorm; exit 1
  exit 10 
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
                                                               $KRED    Author: Kh40z$KNMAL\n"
}

# Help's Menu 
menu(){
  logo
  echo -ne "\n$KGREN" 
  echo -ne "misterscanner.sh:\n\n$KBLUE" 
  echo -ne "Description:\tA simple TCP port scanner\n\n\t$KPRPL usage:\n\t\t$0 --ip <IP_ADDR>\n$KNMAL"
  tput cnorm
}

# Make all the TCP ports
scan(){ 
  
  clear
  # shows the logo
  logo

  # makes the scan
  
  for port in $ports; do 
      
    (exec echo '' > /dev/tcp/$ip/$port) 2>/dev/null 
      
     
    # Check the port's status
    if [ $? -eq 0 ]; then 
          
      # shows the port
      echo -ne  "\n$KGREN[!]$KYLLW $ip:$KBLUE\t$port/OPEN$KNMAL\n";
        
      
    fi
     
  done

  tput cnorm
  
}

# Parameter validation
if [ $2 ]; then
  tput civis
  scan &
else
  menu
fi

wait


