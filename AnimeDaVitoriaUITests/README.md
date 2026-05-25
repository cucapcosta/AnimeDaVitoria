# AnimeDaVitoriaUITests

Testes de UI (XCUITest) que tiram screenshots de cada tela do app, incluindo as
geradas pelos `ForEach` (lista de programas e lista de personagens dentro do
detalhe).

## O que é capturado

Por execução do `test_capturaTodasAsTelas`:

- `01-Lista-Home` — `ListaView` inteira
- `02-Card-NN` — cada card do `ForEach(programas)` (um por programa)
- `03-Detalhe-NN-Topo` — topo do `ProgramaDetailView` (hero + sinopse + InfoBadges)
- `04-Detalhe-NN-Personagens` — seção `ForEach(programa.personagens)` rolada para a vista

Hoje, com 3 programas e 3 personagens cada, isso gera **10 screenshots** por run
(1 home + 3 cards + 3 topos de detalhe + 3 seções de personagens).

## Como adicionar o target no Xcode

Os arquivos Swift do app não estão dentro de um `.xcodeproj` versionado, então
o target de UITests precisa ser anexado ao projeto local:

1. Abra o `AnimeDaVitoria.xcodeproj` no Xcode.
2. `File → New → Target… → iOS → UI Testing Bundle`.
3. Nome: `AnimeDaVitoriaUITests`. Target to Test: `AnimeDaVitoria`.
4. Remova os arquivos criados por padrão (`AnimeDaVitoriaUITests.swift`,
   `AnimeDaVitoriaUITestsLaunchTests.swift`).
5. `Add Files to "AnimeDaVitoria"…` apontando para esta pasta e marque o
   target `AnimeDaVitoriaUITests`.
6. No target, em **Build Settings → Info.plist File**, use
   `AnimeDaVitoriaUITests/Info.plist`.

## Como rodar

Pelo Xcode:

- `Cmd+U` (roda todos os testes) ou clique no diamante ao lado de
  `test_capturaTodasAsTelas`.

Pela linha de comando:

```bash
xcodebuild test \
  -project AnimeDaVitoria.xcodeproj \
  -scheme AnimeDaVitoria \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -only-testing:AnimeDaVitoriaUITests/ScreenshotUITests/test_capturaTodasAsTelas \
  -resultBundlePath build/UITestResults.xcresult
```

## Como extrair os screenshots

Os prints ficam dentro do `.xcresult`. Para exportar como `.png`:

```bash
# Lista os attachments
xcrun xcresulttool get --format json --path build/UITestResults.xcresult > result.json

# Ou usando a flag --export-attachments (Xcode 15+)
xcrun xcresulttool export attachments \
  --path build/UITestResults.xcresult \
  --output-path build/screenshots
```

No Xcode, basta abrir o **Report Navigator** (`Cmd+9`) → escolher o último run
de teste → expandir `test_capturaTodasAsTelas` → cada anexo aparece com o nome
definido (`01-Lista-Home`, `02-Card-01`, etc.) e pode ser arrastado para o Finder.
