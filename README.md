Grupo por: Lucas Periquito, Davi Merigo, Ian Simão e Vitoria Novaes. 

### Início

&emsp;Para começar, nós criamos o repositório e incluímos a base dos arquivos que estava presente no documento. Na definição do escopo, decidimos pelo "ir além" do projeto, implementando o ScrollView e a página genérica de detalhes, que irá receber os dados dos animes selecionados


### Dos Cards

&emsp;Começamos a trabalhar com o card, de forma a definir o visual inicial do sistema e os dados que nós precisaríamos. Em um consenso geral, criamos a estrutura de dados baseada no wireframe, com: Nome, Gênero, Texto da Badge, Nota, Emoji da Thumbnail, e cor base do card. Depois disso, criamos as thumbnails utilizando Rectangles com a mesma cor base da barra lateral, além de um emoji sobreposto no centro. Tivemos muita dificuldade em utilizar o teclado.
 
&emsp;A questão do teclado virou um problema focal do projeto, levando a 3 discussões, 2 socos, 2 tapas, 132 mortos e 6 gemidos do pesquisador Ian Simão. Murilo nos deu outro teclado e comecou a funcionar agora. Ainda assim, Ian teve que pesquisar "Aspas" no Google, e copiar/colar no código.

&emsp;Terminamos o card, discutimos como a estrutura estava sendo implementada e decidimos simplificar passando apenas as variaveis direto ao inves de ser um struct pronto. Partimos para fazer a lista de cards na tela principal, já utilizando o ScrollView vertical para deixar pronto para acomodar qualquer quantidade de cards, mas ainda fazendo os 3 cards hard-coded com os dados.

&emsp;Descobrimos que metade dos problemas do Xcode podem ser resolvidos com import SwiftUI, usando o @_exported no card para importar automaticamente para todos os scripts que incluem o card de alguma forma.

&emsp;Novamente mais discussões se deram devido à forma de implementar a mudança de telas com os dados. Descobrimos uma forma de lidar com os parâmetros que deveriam ser inputados para cada tela. Porém, precisávamos declarar ou uma hashtable ou um struct que precisava ser declarado em basicamente todos os arquivos. Decidimos criar um struct global no arquivo inicial, e reutilizar ele em todas as instâncias.

&emsp;Nossa prioridade foi primeiro deixar funcional tanto a navegação, quanto a transmissão de informações entre telas, deixando partes não comprometedoras de lado, como a hero, e outros componentes que não involvem diretamente as funcionalidades.