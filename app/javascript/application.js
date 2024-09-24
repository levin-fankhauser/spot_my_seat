// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

//home/index.html.erb

document.addEventListener("DOMContentLoaded", function () {
  const goButton = document.getElementById("go-button");

  goButton.addEventListener("click", function (event) {
    event.preventDefault(); // Verhindert das automatische Absenden des Formulars

    const seatId = document.getElementById("seat-id").value;

    if (seatId) {
      // Leitet den Benutzer zur Seat-Show-Seite weiter
      window.location.href = `/seats/${seatId}`;
    } else {
      alert("Please enter a valid Seat ID.");
    }
  });
});
