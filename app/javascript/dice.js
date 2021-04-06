function dice (){
	const getId = document.getElementById("dice-btn");
	getId.addEventListener("click", () => {
			const randomNum = Math.floor(Math.random() * 6) + 1;
			//console.log(randomNum);
			const shakeDice = randomNum + ".png";
			const diceImage = document.getElementById("saikoro");
			diceImage.innerHTML = "<img src='/assets/" + shakeDice + "' alt='sample'>";

		  
			

			
	});

}

window.addEventListener("load",dice);
