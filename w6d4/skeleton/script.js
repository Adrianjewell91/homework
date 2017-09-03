document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  //add a listener to the button,
  // on click, append a new li item to the list.
  // --- your code here!
  const sfPlacesForm = document.getElementById('sf-places-form')
  sfPlacesForm.addEventListener("submit", event => {

    event.preventDefault();

    const placeInputEl = document.getElementById("place-name");
    const placeName = placeInputEl.value;
    placeInputEl.value = "";

    const ul = document.getElementById("sf-places");
    const newPlaceLi = document.createElement("li");

    newPlaceLi.textContent = placeName;

    ul.appendChild(newPlaceLi);


  });


  // adding new photos

  // --- your code here!

    //when the button clicks, unhide the form..
  const newImgForm = document.getElementById("photo-form");
  const newImgToggle = document.getElementById("new-photo-toggle");
  const photoFormDiv = document.getElementById("photo-form-div");

  newImgToggle.addEventListener("click", event => {
    photoFormDiv.className = "photo-form-container";
    // alert('worked');
  })
  //when the form is submitted, build a list element from the given url

  newImgForm.addEventListener("submit", event => {

    event.preventDefault();
    // debugger
    const urlEl = document.getElementsByClassName("photo-url-input")[0];
    const urlName = urlEl.value;
    urlEl.value = "";
    //
    const dogUl = document.getElementsByClassName("dog-photos")[0];
    const newUrlLi = document.createElement("li");
    //
    const newUrlImg = document.createElement("img");
    // //
    newUrlImg.src = urlName;
    //
    newUrlLi.appendChild(newUrlImg);
    dogUl.appendChild(newUrlLi);
    // debugger
    // alert(dogUl);

  });

  // and create a new li with the img src inside of it.


});
