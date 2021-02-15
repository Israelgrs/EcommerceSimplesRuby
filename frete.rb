module Frete #assim como para declarar classe, o nome do módulo deve começar com letra maiuscula
    TABELA_FRETE = {"BA" =>1.97, "SP" => 2.57, "RJ" =>4.50, "MG" =>5.00} #utilização de um hash com as chaves e valores
    
    def imprimir_tabela_frete #declaração de um método dentro do módulo
        puts "------TABELA FRETE-------"
        
      TABELA_FRETE.each do |k,v| # declaracao do each para Keys e values, chaves e valores
        puts "#{k} - #{v}"
      end
    
      puts "-----------------------"
    end
    def calcular_valor_final(valor_produto,uf) #calculando o valor final, pega o valor do produto e a uf para onde ele vai
    valor_produto * TABELA_FRETE[uf] #depois se muliplica o valor do produto pelo valor da uf na tabela frete
    end
end
