var popup = document.querySelector(".popup");
         var trigger = document.querySelector(".trigger");

        function togglePopup() {
             popup.classList.toggle("show-popup");
         }

        trigger.addEventListener("click", togglePopup);