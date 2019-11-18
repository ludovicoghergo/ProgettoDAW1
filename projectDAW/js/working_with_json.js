var http_request = new XMLHttpRequest();
var url = "https://api.jsonbin.io/b/5dd1c659ee15a6060aa314bd"; // adres z danymi w formacie JSON
let img_name;
let img_path='./images/products/';
// pobierz dane w formacie JSON z serwera
http_request.onreadystatechange = handle_json;
http_request.open("GET", url);
http_request.setRequestHeader("secret-key", "$2b$10$CwGL6myH0Hc1h3HRcEJHQuwa9u25Q2pT7/6to2MTUnyBoWBk2ClP.");
http_request.send(null);

function handle_json() {
       if (http_request.readyState == 4) {
               if (http_request.status == 200) {
                       var json_data = http_request.responseText; // pobranie tekstu
                       var the_object = JSON.parse(json_data);  // zamiana tekstu na obiekt JSON
                       let img_name = the_object.products[1].img
                       img_path+=img_name+`"`;
                       //$("#text").text(img_path);
                       //$('#img').prepend('<img id="motherboard" src="'+img_path+ '///>')
                       //console.log( $('.row w-100:nth-child(0) a'));
                       $('#products .row.w-100 div:nth-of-type(1)').find('#product-link').eq(0).prepend('<img id="motherboard" class="card-img-top" src="'+img_path+ '// alt=""/>');
                       //$('#test p:nth-child(1)').css("background-color", "yellow");
                    } else {
                       alert('Wystąpił problem z wybranym adresem URL.');
               }
               http_request = null;
       }
}