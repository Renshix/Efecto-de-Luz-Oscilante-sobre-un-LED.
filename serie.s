PROCESSOR 16F887
    #include <xc.inc>  
    
    
    CONFIG FOSC=INTRC_NOCLKOUT 
    CONFIG WDTE=OFF
    CONFIG PWRTE=ON
    CONFIG MCLRE=OFF
    CONFIG CP=OFF
    CONFIG CPD=OFF
    CONFIG BOREN=OFF
    CONFIG IESO=OFF
    CONFIG FCMEN=OFF
    CONFIG LVP=ON
    CONFIG DEBUG=ON
    
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
     
    
    PSECT udata
var:
    DS 1 
PSECT resetVEC,class=CODE, delta=2
resetvec:
    PAGESEL main
    goto main
    
    PSECT code
 main:
    BANKSEL PORTA
    clrf PORTA
    BANKSEL ANSEL
    bcf ANSEL,0
    bcf ANSEL,1
    bcf ANSEL,2
    bcf ANSEL,3
    bcf ANSEL,4
    BANKSEL TRISA
    movlw 0x00
    movwf TRISA
     BANKSEL PORTA 
      movf PORTA,W
      PUERTO:
     btfss PORTA,0
     bsf PORTA,0
     bsf PORTA,1
     bsf PORTA,2
     bsf PORTA,3
     bsf PORTA,4
   
      btfss PORTA,4
      goto PUERTO 
      bcf PORTA,4
      bcf PORTA,3
      bcf PORTA,2
      bcf PORTA,1
      bcf PORTA,1
      goto PUERTO 
     
      END