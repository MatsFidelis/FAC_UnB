# FAC 

Repositório para armazenar as atividades, estudos e anotações da disciplina de Fundamentos de Arquitetura de Computadores, realizada no período 2023.2 para o curso de Engenharia de Software ministrado na Universidade de Brasília (UnB).

A disciplina tem como objetivo mostrar conceitos e fundamentos quanto a arquitetura computacional e a conceitos de programação em linguagem Assembly MIPS e Assembly RISCV, akém de apresentar conceitos quanto a paradigmas de computação que determinam a forma como os programas são executados e que são indicadores de desempenho e eficiência em sistemas de computação, além de apresentar conceitos de organização de computadores, como memória, processadores, dispositivos de entrada e saída, e barramentos, e toda sua relação entre hardware e software.

#

### Formativa 1 - Fundamentos de assembly MIPS 1
ㅤ
* A - Olá Mundo [[PDF]](questoes/olamundo.pdf)
* B - Soma de dois numeros [[PDF]](questoes/soma.pdf)
* C - Pneu [[PDF]](questoes/pneu.pdf)
* D - Acesso à Memoria [[PDF]](questoes/hotel-simplificado.pdf)

#### --> [Resoluções das questões](link_para_pasta_com_as_solucoes)

#

## Tutorial de instalação Assembly - MIPS (spim) - **Linux**
1. Abra o terminal e execute o seguinte comando:
~~~
sudo apt install spim 
~~~
2. Teste a extensão com a criação de um arquivo `.spim` no VS Code e escreva o código

> *Exemplo* - Hello World:
~~~assembly
.data
    ola: .asciiz "Hello World\n"

.text
main:

    #Imprime a string 'ola'
    
    li $v0, 4
    la $a0, ola
    syscall

    #Encerrar
    li $v0, 10
    syscall
~~~
3. Por fim, abra a pasta local do arquivo no terminal e execute o comando:
~~~
spim -f nome_do_arquivo.spim
~~~
#
>### Tabela: Chamadas de sistema. 

| Service         | System Call Code | Arguments                                        | Result                   |
|-----------------|------------------|--------------------------------------------------|--------------------------|
| print_int       | 1                | $a0 = integer                                    |                          |
| print_float     | 2                | $f12 = float                                     |                          |
| print_double    | 3                | $f12 = double                                    |                          |
| print_string    | 4                | $a0 = string                                     |                          |
| read_int        | 5                |                                                  | integer (in $v0)         |
| read_float      | 6                |                                                  | float (in $f0)           |
| read_double     | 7                |                                                  | double (in $f0)          |
| read_string     | 8                | $a0 = buffer, $a1 = length                       |                          |
| sbrk            | 9                | $a0 = amount                                     | address (in $v0)         |
| exit            | 10               |                                                  |                          |
| print_character | 11               | $a0 = character                                  |                          |
| read_character  | 12               |                                                  | character (in $v0)       |
| open            | 13               | $a0 = filename, $a1 = flags, $a2 = mode          | file descriptor (in $v0) |
| read            | 14               | $a0 = file descriptor, $a1 = buffer, $a2 = count | bytes read (in $v0)      |
| write           | 15               | $a0 = file descriptor, $a1 = buffer, $a2 = count | bytes written (in $v0)   |
| close           | 16               | $a0 = file descriptor                            | 0 (in $v0)               |
| exit2           | 17               | $a0 = value                                      |                          |

Para acessar as informações completas, clique [aqui](https://www.doc.ic.ac.uk/lab/secondyear/spim/node8.html).
#
>### Tabela Registradores de Inteiros
| Nome Lógico | Nome real | Uso                                                  |
|-------------|:---------:|------------------------------------------------------|
| $zero       |     0     | Contante 0                                           |
| $at         |     1     | Reservado pelo assembler                             |
| $v0 … $v1   |   2...3   | Cálculo de expressões e valor de retorno das funções |
| $a0 … $a3   |   4...7   | Primeiros 4 pâmetros das funções                     |
| $t0 … $t7   |   8...15  | Geral (Pode não ser reservado pelas funções          |
| $s0 … $s7   |  16...23  | Geral (Pode ser preservado pelas funções)            |
| $t8 … $t9   |  24...25  | Geral (Pode não ser reservado pelas funções          |
| $k0 … $k1   |  26...27  | Reservado pelo kernel do S.O                         |
| $gp         |     28    | Ponteiro para área global (Global Pointer)           |
| $sp         |     29    | Stack Pointer                                        |
| $fp         |     30    | Frame Pointer                                        |
| $ra         |     31    | Endereço de retornos das funções (Return Address)    |
