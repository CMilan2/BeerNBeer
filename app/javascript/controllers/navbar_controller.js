import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["header"];

	connect() {
		this.previousScroll = window.scrollY; // Keep track of the previous scroll position
		window.addEventListener("scroll", this.handleScroll);
	}

	disconnect() {
		window.removeEventListener("scroll", this.handleScroll);
	}

	handleScroll = () => {
		const currentScroll = window.scrollY;

		if (currentScroll > this.previousScroll && currentScroll > 0.5) {
			// Scrolling down
			this.headerTarget.classList.add("scrolled");
		} else if (currentScroll < this.previousScroll || currentScroll <= 0.5) {
			// Scrolling up or back to top
			this.headerTarget.classList.remove("scrolled");
		}

		// Update previous scroll position for the next scroll event
		this.previousScroll = currentScroll;
	};
}
