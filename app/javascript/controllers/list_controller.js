import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "output", "input", "card"];

  toggleForm() {
    const element = this.formTarget;
    element.classList.toggle("hidden");
  }

  createSuccess(event) {
    const [_data, _status, xhr] = event.detail;

    this.outputTarget.innerHTML += xhr.response;
    this.inputTarget.value = "";
  }
}
