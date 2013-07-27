var handleClick = function(event) {
	alert(event.type);
};

var button = document.querySelector('#bigbutton');
button.addEventListener('click', handleClick);
