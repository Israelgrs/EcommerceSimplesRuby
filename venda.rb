require_relative "pagamento" #aqui se importa os outros dois arquivos com o métodos require_relative
require_relative "frete" #nao é necessário colocar o .rb do formato do arquivo

class Venda #declaracao de classe
    include Frete #importando os dois modulos criados
    include Pagamento 

    PRODUTOS = { "PS3" =>900.00, "PS4" => 1600.00 } #declaracao de constante com os produtos e seus valores em uma hash
    
    def imprimir_produtos #metodo de impirmir a tabela produtos
        puts "-------TABELA DE PRODUTOS----------"
        PRODUTOS.each do |k,v| #k e v significam keys e values, chaves e valores
                    puts "#{k} - #{SIMBOLO_MOEDA} #{v}"  #aqui é como a tabela deve funcionar, mostrando chaves, valores e o simbolo da moeda
            end
        puts "-----------------------------------"
    end

    def vender #metodo vender
        puts "Olá, seja bem-vindo!" #primeiras mensagens exibidas ao cliente
        puts "O que deseja comprar?"
       
        
        imprimir_produtos #chamando o metodo desta mesma classe, acima
    
        puts ">Digite o nome do produto que deseja comprar" #coleta pela entrada principal (teclado) o nome do produto
        produto = gets.chomp

        puts "Para onde deseja enviar?"
        imprimir_tabela_frete
    
        puts ">Digite a UF que você deseja enviar" #coleta a uf do cliente pelo teclado
        uf= gets.chomp

        puts "Calculando..."
        valor_final = calcular_valor_final(PRODUTOS[produto], uf) #chama o metodo calcular valor final que está no modulo frete e efetua o calculo com o valor do produto que está na hash

        puts "Você deve pagar #{SIMBOLO_MOEDA} #{valor_final} do produto + frete." #apenas informando ao cliente que tera que efetuar pagamento do produto e frete

        puts "Deseja pagar? (S/N)" 
        opcao = gets.chomp #coletando resposta do cliente

        if opcao == "S"
            pagseguro = Pagamento::Pagseguro.new #inicia o metodo initialize da classe pagseguro no modulo pagamento
            pagar(valor_final)
        else
            puts "Que pena, fica para a próxima :c" #caso o cliente responda N ou qualquer outra coisa
         end
    end
end
