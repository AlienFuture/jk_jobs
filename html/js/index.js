var jobList = {}

$(document).keyup(function(e) {
	if (e.key === "Escape") {
	  $('.container-fluid').css('display', 'none');
	  $.post('http://jk_jobs/closeMenu', JSON.stringify({}));
 }
});
$(document).ready(function() {
	window.addEventListener('message', function(event) {
		var item = event.data;
		if (item.active == true) {
			$('.container-fluid').css('display', 'block');
			fetchAndWriteJobs(item.jobs)
			jobList = item.jobs;
			console.log(item.jobs.length)

		} else if (item.active == false) {
			$('.container-fluid').css('display', 'none');
		}
	});
})

let scale = 0;
const cards = Array.from(document.getElementsByClassName("job"));
const inner = document.querySelector(".inner");

function slideAndScale() {
cards.map((card, i) => {
	card.setAttribute("data-scale", i + scale);
	inner.style.transform = "translateX(" + scale * 8.5 + "em)";
});
}

function fetchAndWriteJobs(jobs) {
	var fourJobs = "";
	for(var i = 1; i<=jobs.length;i++) {
		if(i % 4 != 0) {
			fourJobs += (`<div class="job"><button class="tittle">${jobs[i-1].label}</button><img src="${jobs[i-1].icon}" height="100" width="100"><button onClick="sendSelectedJob(${i-0})" id="${jobs[i-1].name}" class="interview">Jelentkezés állásra</button></div>`)
		}
			else {
			fourJobs += (`<div class="job"><button class="tittle">${jobs[i-1].label}</button><img src="${jobs[i-1].icon}" height="100" width="100"><button onClick="sendSelectedJob(${i-0})" id="${jobs[i-1].name}" class="interview">Jelentkezés állásra</button></div>`)
			$('.container-fluid').append('</div></div><div class="container"><div class="inner">' + fourJobs)
			if(i != jobs.length)
				fourJobs = ""
		}
		if(i == jobs.length)
			$('.container-fluid').append('</div></div><div class="container"><div class="inner">' + fourJobs)
	}
}

function sendSelectedJob(index) {
	console.log(`selected ${jobList[index-1].name} job`)
	$.post('http://jk_jobs/registerJob', JSON.stringify(jobList[index-1].name))
}

(function init() {
slideAndScale();
cards.map((card, i) => {
	card.addEventListener("click", () => {
		const id = card.getAttribute("data-scale");
		if (id !== 2) {
			scale -= id - 2;
			slideAndScale();
		}
	}, false);
});
})();

