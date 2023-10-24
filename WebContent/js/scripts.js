var sidebarOpen = false;
var sidebar = document.getElementById("sidebar");

function openSidebar() {
	if (!sidebarOpen) {
		sidebar.classList.add("sidebar-responsive");
		sidebarOpen = true;
	}
}

function closeSidebar() {
	if (sidebarOpen) {
		sidebar.classList.remove("sidebar-responsive");
		sidebarOpen = false;
	}
}

function changeFormContentPrices() {
	var service = document.getElementById('service').value
	var bulk = document.getElementById('bulk');
	var dryclean = document.getElementById('dry-clean');

	if (service == 'dry_clean') {
		bulk.style.display = "none";
		dryclean.style.display = "block";
	} else if (service == 'bulk') {
		bulk.style.display = "block";
		dryclean.style.display = "none";
	}
}

function validateBillCreation() {
	let qty = document.getElementsByName('quantity').value;
	var numbers = /^[0-9]+$/;
	if (qty <= 0) {
		alert("Please Enter a valid Quantity")
		return false;
	}
	else if (qty.value.match(numbers) == false) {
		alert("Please Enter a valid Quantity")
		return false;
	}

}




