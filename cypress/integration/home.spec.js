/// <reference types="cypress" />
describe("Jungle", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000")
  });

  it("renders to the products view when teh home page is visited", () => {
    cy.contains("Looking for a way to add some life to your home?");
  });
});
