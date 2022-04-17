programa
{
	inclua biblioteca Util
	inclua biblioteca Arquivos --> a
	
	const inteiro tamanho = 100
	cadeia usuario, senha, usuvet[tamanho], sevet[tamanho], nome, nascimento, twitter, linha = ""
	cadeia fileusu = "usuario.txt", filese = "senha.txt", dadosusu = "dados.txt", filet = "twiter.txt"
	inteiro op, usado = 0
	logico achou = falso

	funcao inicio()
	{
		dados()
		se(a.arquivo_existe(fileusu) e a.arquivo_existe(filese) e a.arquivo_existe(dadosusu) e a.arquivo_existe(filet)){
		opcao()
		}
		senao{
			escreva("arquivo não existe")
			}
	}
	funcao dados()
	{
		
		inteiro arquivo= a.abrir_arquivo(fileusu, a.MODO_LEITURA)
		para(inteiro i = 0; i < tamanho; i++){
		usuvet[i] = a.ler_linha(arquivo)
		}
		a.fechar_arquivo(arquivo)
		
		arquivo = a.abrir_arquivo(filese, a.MODO_LEITURA)
		para(inteiro i = 0; i < tamanho; i++){
		sevet[i] = a.ler_linha(arquivo)
		}
		a.fechar_arquivo(arquivo)

		
	}
	funcao opcao()
	{
		escreva("Você quer realizar um cadatro ou já tem um?")
		escreva("\n1- Cadastro")
		escreva("\n2- Login\n")
		leia(op)
		limpa()
		se(op == 1){
			cadastro()
			}
		senao se(op == 2){
			login()
			}
		senao{
			escreva("Opção invalida")
			}
	}
	funcao cadastro()
	{
		escreva("Para realizarmos o seu cadastro, iremos pedir algumas informações.")
		escreva("\nDigite o seu nome completo\n")
		leia(nome)
		limpa()
		escreva("\nDigite o sua data de nascimento\n")
		leia(nascimento)
		limpa()
		
		inteiro files = a.abrir_arquivo(dadosusu, a.MODO_ACRESCENTAR)

		a.escrever_linha(nome, files)
		a.escrever_linha(nascimento, files)

		a.fechar_arquivo(files)

		escreva("\nDigite um nome de usuario\n")
		leia(usuario)
		limpa()
		escreva("\nDigite uma senha\n")
		leia(senha)
		limpa()
		
		files = a.abrir_arquivo(fileusu, a.MODO_ACRESCENTAR)

		a.escrever_linha(usuario, files)

		a.fechar_arquivo(files)

		
		files = a.abrir_arquivo(filese, a.MODO_ACRESCENTAR)

		a.escrever_linha(senha, files)

		a.fechar_arquivo(files)

		login()
		
	}
	funcao login()
	{
		inteiro arquivo= a.abrir_arquivo(fileusu, a.MODO_LEITURA)
		para(inteiro i = 0; i < tamanho; i++){
		usuvet[i] = a.ler_linha(arquivo)
		}
		a.fechar_arquivo(arquivo)
		
		inteiro arquivo2 = a.abrir_arquivo(filese, a.MODO_LEITURA)
		para(inteiro i = 0; i < tamanho; i++){
		sevet[i] = a.ler_linha(arquivo)
		}
		a.fechar_arquivo(arquivo)

		escreva("Escreva o seu nome de usuario\n")
		leia(usuario)
		limpa()
		
		para(inteiro i = 0; i < tamanho; i++){
			se(usuvet[i] == usuario){
  				achou = verdadeiro
				}
			}
			
		se(achou == verdadeiro){
		escreva("Ola ",usuario,"\nDigite a sua senha\n")	
		leia(senha)
		limpa()
		para(inteiro i = 0; i < tamanho; i++){
			/*enquanto(sevet[i] != senha){
				escreva("Ola ",usuario,"\nSenha incorreta\nDigite a sua senha novamente\n")	
				leia(senha)
				limpa()
			     } */
			se(sevet[i] == senha){
  				menu()
				achou = verdadeiro
				}
			senao se (achou == falso e sevet[i] != senha){
				escreva("Senha incorreta")
				}
			
			}
		}

		senao se(achou == falso){
				escreva("Nome de usuario não existe")
				}	
	}
	
	funcao menu()
	{
		faca
		{
			escreva("O que você quer fazer?\n")
			
			escreva("  1 -> Escrever uma frase \n")
			escreva("  2 -> Ver as frases\n")
			escreva("  3 -> Sair\n")
			
			escreva("Digite a sua opção: ")
			
			leia(op)

			escolha (op)
			{
				
				caso 1: 
					limpa()
			 		leia(twitter)
			 		inteiro files = a.abrir_arquivo(filet, a.MODO_ACRESCENTAR)

					a.escrever_linha("<" + usuario + ">" + " " + twitter, files)

					a.fechar_arquivo(files)
			 	pare
			 	
			 	caso 2: 
			 		limpa()
			 		
			 		inteiro arquivo = a.abrir_arquivo(filet, a.MODO_LEITURA)
					para(inteiro i = 0; i < 6; i++){
					escreva(a.ler_linha(arquivo),"\n")
					}
					a.fechar_arquivo(arquivo)
	
					Util.aguarde(10000)
					limpa()
			 	pare
			 	
			 	caso 3: 
			 		escreva("Programa finalizado")
			 	pare
			 	
			 	caso contrario:
			 		
			}			 
		}
		enquanto(op < 3)
	}

}
