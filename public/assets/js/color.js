$(document).ready(function() {
    var code = $('code');
    
    for (var i = 0; i < code.length; i++) {
	var lang = code[i].className;
	code[i].id = lang+i;
	id = '#'+code[i].id;
	$(id).attr('data-language', lang);
    }
    
    Rainbow.color();
});
