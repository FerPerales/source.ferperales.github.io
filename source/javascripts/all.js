//= require turbolinks

(function(){
	var activeOption;
	option = window.location.pathname.split('/')[1];
	if(option === ''){
		option = 'home';
	}
	var el = document.getElementById(option);
	el.setAttribute('class', 'active-option');
})();
