let req_get = new XMLHttpRequest();
let url = "https://api.jsonbin.io/b/5dd1c659ee15a6060aa314bd";
let img_name;
let img_path_prefix = './images/products/';
let img_path='';
let j=0;
// download JSON data from server
req_get.onreadystatechange = handle_json;
req_get.open("GET", url);
req_get.setRequestHeader("secret-key", "$2b$10$CwGL6myH0Hc1h3HRcEJHQuwa9u25Q2pT7/6to2MTUnyBoWBk2ClP.");
req_get.send(null);
changeCatalog(0);

function handle_json() {
        if (req_get.readyState == 4) {
                if (req_get.status == 200) {
                        var json_data = req_get.responseText; // text download
                        var the_object = JSON.parse(json_data); // change text to JSON
                        img_name = the_object.products[1].img
                        img_path += img_name;
                        // $('#products .row.w-100 div:nth-of-type(1)').find('#product-link').eq(0).prepend('<img id="motherboard" class="card-img-top" src="' + img_path + '// alt=""/>');
                        for (let i = 0; i < the_object.products.length; i++) {
                                img_name = the_object.products[i+j].img;
                                img_path = img_path_prefix + img_name;
                                
                                $('#products .row.w-100 div:nth-of-type(1)').find('#product-link img').eq(i).attr("src", img_path);
                                $('#products .row.w-100 div:nth-of-type(1)').find('.card-text').eq(i).text(the_object.products[i+j].text);
                                $('#products .row.w-100 div:nth-of-type(1)').find('.card-body a').eq(i).text(the_object.products[i+j].name)
                        }
                }
        else {
                alert('Wystąpił problem z wybranym adresem URL.');
        }
        //req_get = null;
}
}
function changeCatalog(val){
 j=val;
 req_get.open("GET", url);
req_get.setRequestHeader("secret-key", "$2b$10$CwGL6myH0Hc1h3HRcEJHQuwa9u25Q2pT7/6to2MTUnyBoWBk2ClP.");
req_get.send(null);
for(let k=0;k<8;k++) $("#portfolio-item"+k).attr("at",j+k);
 handle_json();
}

function setCookie(cname,cvalue,exdays){
        var d= new Date();
        d.setTime(d.getTime() + (exdays*24*60*60*1000));
        var expires = "expires=" + d.toGMTString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path/";
    }
for(let i=0;i<8;i++){
$("#portfolio-item"+i).click(function(e){
        e.preventDefault();
        setCookie("catalog_number",$(this).attr('at'), 1);
        window.location.href = "./product_info.html";
});
}