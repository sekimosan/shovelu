function dice (){
	const getId = document.getElementById("dice-btn");
	getId.addEventListener("click", () => {	
		var count = 0;
    const shake = () => {
			const randomNum = Math.floor(Math.random() * 6) + 1;
			const shakeDice = randomNum + ".png";
			const diceImage = document.getElementById("saikoro");
			diceImage.innerHTML = "<img src='/assets/" + shakeDice + "' alt='sample'>";
      count++;
		};
		var setI = setInterval(() =>{shake();if(count > 20){clearInterval(setI);}},100);	
	});

}

window.addEventListener("load",dice);
