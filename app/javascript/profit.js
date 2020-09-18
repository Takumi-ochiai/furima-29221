window.addEventListener('turbolinks:load', function(){

  const textField = document.getElementById("item-price")
  const addTax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  textField.addEventListener("change", function(){
    const value = textField.value
    addTax.textContent = Math.floor(value * 0.1)
    profit.textContent = Math.floor(value * 0.9)
  })

})