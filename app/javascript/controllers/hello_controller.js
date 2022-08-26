// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>
import Rails from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("Hello, Stimulus!");
  }

  showForm() {
    const element = event.currentTarget.children[0];
    element.classList.remove("hidden");
  }

  onPostSuccess(event) {
    console.log("success!");
  }
}
