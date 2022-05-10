/// <reference types="cypress" />
describe("Jungle", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000")
  });

  it("renders the products view when the home page is visited", () => {
    cy.contains("Looking for a way to add some life to your home?");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
});
