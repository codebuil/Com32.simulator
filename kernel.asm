
%include "./file/base.s"

hellos db  "hello world...",0
kernel_main:
          
          call clears
                  
          mov ebx, x
          mov eax,10
          mov [ebx],eax
          mov ebx, y
          mov [ebx],eax               
          mov esi,hellos
          mov edi,0xb8000

          mov ecx,13                

          mov edx,2  
          call print32
               
                          
                          
                          
          EXITDO:                
                                    
                                    
                    EXIT:          
 
 ret               
          jmpps:
jmp jmpps



