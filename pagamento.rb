module Pagamento
    SIMBOLO_MOEDA = "R$"

    def pagar(valor_final)
        puts "Deseja pagar com cartão? (S/N)"
        opcao = gets.chomp

        if opcao == "S"
            puts "Pagando com cartao..."
        else
            puts "Pagando com dinheiro..."
        end
    end

        class Pagseguro
            def initialize
                puts "Usando pagseguro..."
            end
        end
end
