/* Classe principal modificada para ler de 'input.txt' */
import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Define o arquivo de entrada
            String inputFile = "input.txt";
            System.out.println("Lendo expressoes de '" + inputFile + "'...\n");

            // Cria um leitor de arquivo para o scanner
            FileReader fileReader = new FileReader(inputFile);
            
            // Inicializa o scanner e o parser com o arquivo
            scanner s = new scanner(fileReader);
            parser p = new parser(s);
            
            // Executa a análise do arquivo inteiro
            p.parse();
            
            System.out.println("Análise de todas as expressões concluída.");

        } catch (FileNotFoundException e) {
            System.err.println("Erro: Arquivo 'input.txt' não foi encontrado.");
        } catch (Exception e) {
            System.err.println("Ocorreu um erro de sintaxe ou execução.");
            e.printStackTrace();
        }
    }
}

