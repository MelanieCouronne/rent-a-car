const searchForm = () => {
  // Variables
  let searchIcon = document.querySelector(".search-bar__search-icon"),
    closeIcon = document.querySelector(".search-bar__close-icon .far"),
    searchBar = document.querySelector(".search-bar"),
    searchInput = document.querySelector(".search-bar__search-input input"),
    inputTrigger = document.querySelector("#search-input__trigger");

  // Handle Open & Close Search Bar
  if (searchIcon) {
    searchIcon.onclick = () => {
      searchBar.classList.toggle("search-bar--active");
    };
  }

  // Handle Close Search Bar
  if (closeIcon) {
    closeIcon.onclick = () => {
      searchInput.value = "";
      searchInput.focus();
    };
  }

  // Handle Input Placeholder
  if (searchInput) {
    searchInput.onfocus = function () {
      let place = this.getAttribute("placeholder");
      this.setAttribute("data", `${place}`);
      this.removeAttribute("placeholder");
    };

    searchInput.onblur = function () {
      this.setAttribute("placeholder", `${this.getAttribute("data")}`);
    };
  }

  // Handle Trigger a Button Keyup on Enter
  if (inputTrigger) {
    inputTrigger.onkeyup = (event) => {
      if (event.keyCode === 13) {
        searchInput.value.submit();
      }
    };
  }

}

export { searchForm };
