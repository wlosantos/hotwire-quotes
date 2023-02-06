import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  connect() {
    setTimeout(()=>{
      this.element.classList.remove("hidden");
      this.element.classList.add("transition", "ease-in-out", "duration-500", "opacity-0");

      setTimeout(()=>{
        this.element.classList.remove("opacity-0");
        this.element.classList.add('transition', "opacity-100");
      }, 200);
    }, 1000);

    setTimeout(()=>{
      this.close();
    }, 6000);
  }

  close(){
    this.element.classList.remove("opacity-100");
    this.element.classList.add("transition", "ease-in-out", "duration-500", "opacity-0");

    setTimeout(()=>{
      this.element.classList.add("hidden");
    }, 500);
  }
}
