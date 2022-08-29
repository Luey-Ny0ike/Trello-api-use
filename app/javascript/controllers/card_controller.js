import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "card",
    "cardName",
    "updateForm",
    "input",
    "submitBtn",
    "loadingGif"
  ];

  toggleForm() {
    this.cardNameTarget.classList.toggle("hidden");
    this.updateFormTarget.classList.toggle("hidden");
  }

  updateSuccess(event) {
    const [_data, _status, xhr] = event.detail;

    this.cardTarget.outerHTML = xhr.response;
    // this.inputTarget.value = "";
  }

  deleteCard() {
    this.cardTarget.style = "display:none";
  }

  submitBtn() {
    this.submitBtnTarget.classList.toggle("hidden");
    this.loadingGifTarget.classList.toggle("hidden");
  }
}
