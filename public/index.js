

var productTemplate = document.querySelector("#product-card");
var productContainer = document.querySelector(".row");


axios.get("http://localhost:3000/products").then(function(response) {
  var products = response.data;
  products.forEach(function(product) {
    var productClone = productTemplate.content.cloneNode(true);
    productClone.querySelector(".name").innerText = product.name;
    productClone.querySelector(".description").innerText = product.description; 
    productClone.querySelector(".price").innerText = product.price;
    productClone.querySelector(".prod-img").src = product.images[0].url;
    productContainer.appendChild(productClone);
  });
});


