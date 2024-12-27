.data
	pula: .string "\n"
	print1: .string "bit-paridade:  " 
	print2: .string  "saida: " 
	print_erro: .string  "entrada incorreta" 
.text 
main:
# Ler o número
    li a7, 5          
    ecall
    
    mv t0, a0           # Armazena o número lido em t0
    mv t1,t0		    #copia t0
    
    
    
#salva o valor lido na pilha
    addi sp, sp, -4
    sw a0, 0(sp)
    
    li t2, 127	        #armazena o número 128 para verificação em t2
    

    
# Verificar entrada
    blt t0, zero, erro  # Se t0 < 0, erro
    bgt t0, t2, erro    # Se t0 > 127, erro
    
#se não deu erro, o código continua

#colocar um temporario pra contar os bits 1
    li t3,0	
   
for:    
    ble t0, zero, calcular  #condição: se t0<=0, pula pra calcular
    andi t4, t0, 1	        #verifica se o bit menos significativo é 1
    srli t0, t0, 1      	#avança um bit pra direita para o proximo loop
    beqz t4,for	            #se for igual a zero, volta pro loop
    addi t3,t3,1  	        #add 1 ao contador
    j for     

erro: 

    	li a0, 1
    la a1, print_erro       # para printar
	li a7, 64         
	li a2, 17               # Comprimento nda string
	ecall
		
	j concluir		        #volta pro inicio para inserir novo numero
	
calcular: #calcula o bit de paridade 1 ou 0
	li t4, 2
	remu t5, t3, t4	        #armazena se o numero de bits é par ou impar 
	
resultado:
	    la a1, print1
	    li a0, 1            # para printar
	    li a7, 64         
	    li a2, 15           # Comprimento nda string
	    ecall
	    
	    li a7,1		        #para printar o inteiro
	    addi a0, t5,0
	    ecall
	    

	    li t2,1	#t2 = 1
	    beq t5,t2,bitsig1   #compara se a5 == 1, caso seja, pula pra label
	    j saida
	    		   
bitsig1:
	lw t1, 0(sp)            #carrega o valor alocado anteriormente na pilha
	
	slli t2,t2,7 	        #desloca 7 bits a esquerda
	or t1, t1, t2           # junta o valor deslocado e o t1
	
	sw t1, 0(sp)            #salva o novo valor	
	
saida:	    
		 la a0, pula
	    li a7,4
	    ecall

	    la a1, print2
	    li a0, 1          # para printar
	    li a7, 64         
	    li a2, 7          # Comprimento nda string
	    ecall

	    lw t1, 0(sp)    #carrega o valor alocado anteriormente na pilha
	    li a7,1		    #para printar o inteiro
	    addi a0, t1,0
	    ecall
	    	    		    
concluir:


#desalocar a pilha
	lw t1, 0(sp)	    #recupera os valores
	addi sp, sp, 4	    #desalocando...

	    la a0, pula
	    li a7,4
	    ecall

	li a0, 0          # Código de saída
	li a7, 93         # encerrar
	ecall