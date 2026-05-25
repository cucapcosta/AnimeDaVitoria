import XCTest

final class ScreenshotUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func test_capturaTodasAsTelas() throws {
        snapshot("01-Lista-Home")

        let lista = app.scrollViews.firstMatch
        XCTAssertTrue(lista.waitForExistence(timeout: 5), "ScrollView da lista não apareceu")

        let totalCards = lista.buttons.count
        XCTAssertGreaterThan(totalCards, 0, "Nenhum card encontrado na lista")

        for index in 0..<totalCards {
            let card = app.scrollViews.firstMatch.buttons.element(boundBy: index)
            XCTAssertTrue(card.waitForExistence(timeout: 5), "Card #\(index + 1) não encontrado")

            if !card.isHittable {
                app.scrollViews.firstMatch.swipeUp()
            }

            snapshot(String(format: "02-Card-%02d", index + 1))

            card.tap()

            let detalhe = app.scrollViews.firstMatch
            XCTAssertTrue(detalhe.waitForExistence(timeout: 5), "Detalhe do card #\(index + 1) não abriu")

            snapshot(String(format: "03-Detalhe-%02d-Topo", index + 1))

            detalhe.swipeUp()
            snapshot(String(format: "04-Detalhe-%02d-Personagens", index + 1))

            let voltar = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(voltar.waitForExistence(timeout: 5), "Botão de voltar não encontrado")
            voltar.tap()

            XCTAssertTrue(
                app.navigationBars["Programas"].waitForExistence(timeout: 5),
                "Não voltou para a lista após o detalhe #\(index + 1)"
            )
        }
    }

    private func snapshot(_ name: String) {
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
