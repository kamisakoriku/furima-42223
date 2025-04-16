window.addEventListener('turbo:load', () => {
  // 価格入力フォーム要素を取得
  const priceInput = document.getElementById("item-price");
  
  // 価格入力フォームが存在する場合のみ処理を実行
  if (priceInput) {
    // フォームに入力があった際のイベント処理を設定
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      // 販売手数料を計算（10%）し、小数点以下を切り捨て
      const fee = Math.floor(inputValue * 0.1);
      
      // 販売利益を計算（入力価格 - 手数料）
      const profit = Math.floor(inputValue - fee);
      
      // HTMLの要素を取得して表示を更新
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      
      // 要素が存在する場合のみ表示を更新
      if (addTaxDom) {
        addTaxDom.innerHTML = fee;
      }
      
      if (profitDom) {
        profitDom.innerHTML = profit;
      }
    });
  }
});

// フォーム再表示時にも機能するように追加
window.addEventListener("turbo:render", () => {
  // 価格入力フォーム要素を取得
  const priceInput = document.getElementById("item-price");
  
  // 価格入力フォームが存在する場合のみ処理を実行
  if (priceInput) {
    // フォームに入力があった際のイベント処理を設定
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      // 販売手数料を計算（10%）し、小数点以下を切り捨て
      const fee = Math.floor(inputValue * 0.1);
      
      // 販売利益を計算（入力価格 - 手数料）
      const profit = Math.floor(inputValue - fee);
      
      // HTMLの要素を取得して表示を更新
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      
      // 要素が存在する場合のみ表示を更新
      if (addTaxDom) {
        addTaxDom.innerHTML = fee;
      }
      
      if (profitDom) {
        profitDom.innerHTML = profit;
      }
    });
  }
});