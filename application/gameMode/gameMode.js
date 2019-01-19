$(document).ready(function() {
	$.ajax({
	  type: "GET",
	  url: "http://localhost/github_project/EneredMay/api/questions",
	  success: function(response) {
	  	window.localStorage.removeItem('datakeys');
	  	window.localStorage.removeItem('correctAnswer');
	  	var data = JSON.parse(response);
	  	var datakeys = Object.keys(data);
	  	window.localStorage.setItem('datakeys', datakeys);
	  	var correctAnswer = [];
	  	for(var i = 0 ; i < datakeys.length ; i++) {
	  		renderFileData(data[datakeys[i]]);
	  		correctAnswer.push(data[datakeys[i]].correctAnswer);	  		
	  	}
	  	window.localStorage.setItem('correctAnswer', correctAnswer);
	  	attachEvents();
	  }
	});
});





function renderFileData(data) {
	var containerDiv = document.createElement('div');
	containerDiv.setAttribute('class', 'gameMode');


	var createContainer = $('<div class="question displayNone" data-question="'+data.id+'"><h5>'+data.text+'</h5><div class="answers col-xs-12"><span class="col-xs-6 btn" data-value="1">'+data.answer1+'</span><span class="col-xs-6 btn" data-value="2">'+data.answer2+'</span><span class="col-xs-6 btn" data-value="3">'+data.answer3+'</span><span class="col-xs-6 btn" data-value="4">'+data.answer4+'</span></div></div>');

	$('.questions-wrapper').append(createContainer);
}

function attachEvents() {
	// preia id-urile la intrebari din localStorage
	var questionArray = window.localStorage.getItem('datakeys').split(',');
	// preia raspunsurile corecte la intrebari din localStorage
	var correctAnswer = window.localStorage.getItem('correctAnswer').split(',');
	// fac show la prima intrebare
	$('.question[data-question='+questionArray[0]+']').removeClass('displayNone');

	// handle click pe unul din raspunsuri
	$('.answers .btn').click(function() {
		// caut in html id-ul intrebarii curente
		var prevQuestion = this.parentElement.parentElement.getAttribute('data-question');
		// preiau raspunsul selectat
		var answer = this.innerHTML;

		// iterez peste array-ul de id-uri de intrebari din localStorage
		for(var i = 0 ; i < questionArray.length ; i++) {
			// verific data id-ul intrebarii curente este egal cu id-ul intrebarii iterat && verific daca raspunsul selectat este egal cu raspunsul corect al intrebarii
			if(prevQuestion === questionArray[i] && answer === correctAnswer[i]) {
				$(this).addClass('btn-success');
				break;
			} else {
				$(this).addClass('btn-danger');
			}
		}
		setTimeout(function() {
			for(var i = 0 ; i < questionArray.length ; i++) {
				if(prevQuestion === questionArray[i]) {
					$('.question[data-question='+questionArray[i]+']').addClass('displayNone');
					$('.question[data-question='+questionArray[i + 1]+']').removeClass('displayNone');
				}
			}
		}, 800);
		
	});
};

$(".fiftyfifty").on("click", function(){
	var questionId = $(".question:not(.displayNone)").attr("data-question");
	// preia id-urile la intrebari din localStorage
	var questionArray = window.localStorage.getItem('datakeys').split(',');
	// preia raspunsurile corecte la intrebari din localStorage
	var correctAnswer = window.localStorage.getItem('correctAnswer').split(',');
	var correctAnswerNotToBeDeleted;
	for(var i = 0 ; i < questionArray.length ; i++) {
		if(questionArray[i] === questionId) {
			correctAnswerNotToBeDeleted = correctAnswer[i];
		}
	}
    
    var deleted = true;
    while(deleted) {
    	if ( $(".question:not(.displayNone) .btn:not(.displayNone)").length < 3 ) {
    		deleted = false;
    	}
    	
    	var randomDeleteValue = Math.floor(Math.random() * 4);
    	if( $(".question:not(.displayNone) .btn:not(.displayNone)")[randomDeleteValue].innerHTML != correctAnswerNotToBeDeleted && $(".question:not(.displayNone) .btn:not(.displayNone)").length > 2 ) {
    		$($(".question:not(.displayNone) .btn:not(.displayNone)")[randomDeleteValue]).addClass('displayNone');
    	}
    	
    }
});


