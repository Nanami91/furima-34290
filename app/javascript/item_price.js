window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
      inputValue;

    const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      addTaxDom;

    const profitNumber = document.getElementById("profit");
      profitNumber.innerHTML = (Math.floor(inputValue - (inputValue * 0.1)));
      profitNumber;
    });
});
