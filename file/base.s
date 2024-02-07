bits 32
org 101000h

mov eax,21cd4cffh
	
jmp kernel_main
fill32:                
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          cmp edx,0
          jnz fill3211
          inc edx                
          fill3211:
          fill321:                
                    mov [edi],al
                    clc                
                    add edi,edx
                    dec ecx                
                    jnz fill321              
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          pop eax                
          ret
clears:
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi   
                    mov edi,0xb8001
                    mov al,0xe0
                    mov ecx,2000                
                    mov edx,2  
                    call fill32    
                    mov edi,0xb8000
                    mov al,32
                    mov ecx,2000                
                    mov edx,2  
                    call fill32       
          
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          pop eax                
          ret                     
copymem32:
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                          
          cmp edx,0
          jnz copymem3211
          inc edx                
          copymem3211:
          cmp ecx,0
          jz copymem326
          copymem321:

          
          
          
        
                    mov al,[esi]
                    
                    mov [edi],al
                    clc                
                    add edi,edx
                    inc esi                
                    dec ecx                
                    jnz copymem321
          copymem326:
          
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          pop eax                
          ret          
          
          
          
          
mem32:                
          push esi                
                          
          and eax,0x0ffff
          clc                
          shl eax,4
          and esi,0x0ffff
          clc                 
          add eax,esi
                          
          pop esi                
          ret                
                
gotoxy:                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                                
          mov esi,eax
          mov edi,ebx
          mov ecx,0
          mov edx,0
          mov eax,esi
          mov ebx,2                
          clc                
          mul ebx                
          mov esi,eax
          mov eax,edi
          mov ebx,160
          clc                
          mul ebx                
          mov ebx,esi
          clc                
          add eax,ebx
          and eax,0xffff
          mov ebx,0xb8000
          clc                
          add eax,ebx               
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          ret                
              
              
              
              
print32:                
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                    
          cmp ecx,0
          jz print3213
          mov eax,0
          mov ebx,0
          mov al,[x]                
          mov bl,[y]                
          call gotoxy
          mov edi,eax
          cmp ecx,255
          JB print3212
          mov ebx,255
          print3212:
          mov edx,2
          call copymem32 
          mov eax,0
          mov ebx,0
          mov al,[x]                
          mov bl,[y]                
          mov esi,ebx
          clc                
          add eax,ecx
          cmp eax,80
          JB print328
          mov ebx,80
          sub eax,ebx
          xor edx,edx
          xor ecx,ecx
          mov ebx,80
          clc                
          div ebx                
          clc                
          add eax,esi
          cmp eax,24
          JB print328
          mov eax,24
          print328:
          mov [y],eax                
          mov [x],edx 
          print3213:              
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          pop eax                
          ret               
          
          
          
x dd 0
y dd 0
color dd 7               
