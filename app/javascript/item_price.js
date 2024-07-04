window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value, 10) || 0;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
  })
})