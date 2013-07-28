var handleClick = function(event) {
	var div = document.createElement('div');
	div.textContent = "Sup, y'all?";
	div.setAttribute('class', 'note');
	document.body.appendChild(div);
};

var button = document.querySelector('#bigbutton');
button.addEventListener('click', handleClick);
