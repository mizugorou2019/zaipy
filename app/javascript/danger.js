window.addEventListener('load', function(){
  
  let quantity = document.getElementsByClassName("item-quantity")

  addEventListener('load', function(){
    const num = quantity.value;
    if( num <= 3) {
      quantity.innerHTML = style.color="#ff0000";
    }
  })
})