window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      const fee = Math.floor(inputValue * 0.1);
      
      const profit = Math.floor(inputValue - fee);
      
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      
      if (addTaxDom) {
        addTaxDom.innerHTML = fee;
      }
      
      if (profitDom) {
        profitDom.innerHTML = profit;
      }
    });
  }
});

window.addEventListener("turbo:render", () => {
  const priceInput = document.getElementById("item-price");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      const fee = Math.floor(inputValue * 0.1);
      
      const profit = Math.floor(inputValue - fee);
      
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      
      if (addTaxDom) {
        addTaxDom.innerHTML = fee;
      }
      
      if (profitDom) {
        profitDom.innerHTML = profit;
      }
    });
  }
});