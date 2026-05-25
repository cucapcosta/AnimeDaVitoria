*Grupo por: Lucas Periquito, Davi Merigo, Ian Simão e Vitoria Novaes.*

### Início

&emsp;Para começar, nós criamos o repositório e incluímos a base dos arquivos que estava presente no documento. Na definição do escopo, decidimos pelo "ir além" do projeto, implementando o ScrollView e a página genérica de detalhes, que irá receber os dados dos animes selecionados

### Dos Cards

&emsp;Começamos a trabalhar com o card, de forma a definir o visual inicial do sistema e os dados que nós precisaríamos. Em um consenso geral, criamos a estrutura de dados baseada no wireframe, com: Nome, Gênero, Texto da Badge, Nota, Emoji da Thumbnail, e cor base do card. Depois disso, criamos as thumbnails utilizando Rectangles com a mesma cor base da barra lateral, além de um emoji sobreposto no centro. Tivemos muita dificuldade em utilizar o teclado.
 
&emsp;A questão do teclado virou um problema focal do projeto, levando a 3 discussões, 2 socos, 2 tapas, 132 mortos e 6 gemidos do pesquisador Ian Simão. Murilo nos deu outro teclado e comecou a funcionar agora. Ainda assim, Ian teve que pesquisar "Aspas" no Google, e copiar/colar no código.

&emsp;Terminamos o card, discutimos como a estrutura estava sendo implementada e decidimos simplificar passando apenas as variaveis direto ao inves de ser um struct pronto. Partimos para fazer a lista de cards na tela principal, já utilizando o ScrollView vertical para deixar pronto para acomodar qualquer quantidade de cards, mas ainda fazendo os 3 cards hard-coded com os dados.

&emsp;Descobrimos que metade dos problemas do Xcode podem ser resolvidos com import SwiftUI, usando o @_exported no card para importar automaticamente para todos os scripts que incluem o card de alguma forma.

&emsp;Novamente mais discussões se deram devido à forma de implementar a mudança de telas com os dados. Descobrimos uma forma de lidar com os parâmetros que deveriam ser inputados para cada tela. Porém, precisávamos declarar ou uma hashtable ou um struct que precisava ser declarado em basicamente todos os arquivos. Decidimos criar um struct global no arquivo inicial, e reutilizar ele em todas as instâncias.

&emsp;Nossa prioridade foi primeiro deixar funcional tanto a navegação, quanto a transmissão de informações entre telas, deixando partes não comprometedoras de lado, como a hero, e outros componentes que não involvem diretamente as funcionalidades. Depois descobrimos que havia um exemplo do struct programa que poderíamos utilizar, e com isso corrijimos o código para se adequar com esse struct de exemplo. Para realizar a navegação, utilizamos o exemplo dado em sala para adequar ao nosso app.

### Dados

&emsp;Com a estrutura navegando e os componentes tomando forma, percebemos que o modelo de dados tinha um problema para nossa implementação, já que não havia campo de cor. Como a cor era usada em múltiplos lugares como barra lateral do card, fundo da thumbnail, fundo do hero, e badge de tipo. Adicionamos cor: Color direto no Programa, junto com id: UUID para torná-lo Identifiable e poder usar o ForEach depois.

&emsp;Aproveitamos também para substituir os três programas originais do enunciado (Naruto, Avatar, Stranger Things) por escolhas do grupo: Attack on Titan, Demon Slayer e One Piece. As sinopses foram escritas com o rigor acadêmico esperado ;)

### Emojis

&emsp;O enunciado optava por emojis de texto (🍜, 🌊, 🔦) nas thumbnails e nos personagens. Quando tentamos usar Text(emoji) dentro de um RoundedRectangle com overlay causou problemas de alinhamento, e a solução melhor e mais rápida foi substituir todos os emojis por SF Symbols, armazenando o nome do símbolo ("shield.lefthalf.filled", "flame.fill", etc.) direto no campo emoji do struct e usando Image(systemName: programa.emoji). Funcionou e ficou visualmente mais consistente.

### Tela de Detalhe

&emsp;A ProgramaDetailView recebe um Programa como parâmetro, conforme o enunciado. O hero ficou mais simples que o wireframe, já que usamos VStack centralizado com o ícone SF Symbol grande, o nome em .largeTitle. Tentamos o ZStack com gradiente escuro e foi descartado por consenso.

&emsp;Os três InfoBadge na seção de informações exibem episódios, temporadas e avaliação, substituindo o "status" do enunciado pela nota. A seção de personagens usa ForEach sobre o array de tuplas com id: \.0, passando nome, papel e emoji para cada CharacterRow. Foi preciso pesquisar vários exemplos práticos para conseguir fazer com que essa parte funcionasse, e foi apenas alguma aspas, ou barra necessária para funcionar.

### ShowCard

&emsp;O ShowCard final seguiu o wireframe de perto: barra lateral de 6pt com programa.cor, thumbnail com RoundedRectangle e SF Symbol sobreposto, e o bloco de texto com tipo, nome, gênero e avaliação em estrela. O badge de tipo ficou como Text simples em .caption, sem aquela cápsula colorida especificada, até para simplificar sem comprometer o conteúdo.

### Encerramento

&emsp;O app rodou no simulador sem crashes, com navegação funcionando entre a lista e as três telas de detalhe.
