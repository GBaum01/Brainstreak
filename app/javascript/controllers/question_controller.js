import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "submit", "answer", "explanation", "explainButton", "result", "submitPracticeBtn", "submittedAnswer", "submittedAnswerText"]

  connect() {
    this.answered = false
  }

  submit(event) {
    event.preventDefault()
    if (this.answered) return

    const user = this.inputTarget.value.trim()
    this.answered = true

    const questionId = this.data.get("question-id")

    // POST answer to server for validation
    fetch(`/questions/${questionId}/answer`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ answer: user })
    })
    .then(response => response.json())
    .then(data => {
      const isCorrect = data.correct

      this.resultTarget.textContent = isCorrect ? "Correct!" : "Incorrect"
      this.resultTarget.style.display = "block"
      this.resultTarget.classList.toggle("text-green-600", isCorrect)
      this.resultTarget.classList.toggle("text-red-600", !isCorrect)

      this.submittedAnswerTextTarget.textContent = user
      this.submittedAnswerTarget.style.display = "block"
      this.formTarget.style.display = "none"

      this.answerTarget.style.display = "block"
      this.explainButtonTarget.style.display = "inline-flex"

      // Check if all questions are answered
      this.checkAllAnswered()
    })
  }

  showExplanation() {
    const isHidden = this.explanationTarget.style.display === "none"
    this.explanationTarget.style.display = isHidden ? "block" : "none"
  }

  checkAllAnswered() {
    const practiceId = this.data.get("practice-id")
    const totalQuestions = parseInt(this.data.get("total-questions"), 10)

    fetch(`/practices/${practiceId}`, {
      method: "GET",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      }
    })
    .then(response => response.json())
    .then(data => {
      console.log("Progress check:", { answered_count: data.answered_count, total: totalQuestions })
      if (data.answered_count === totalQuestions) {
        console.log("All questions answered! Showing submit button.")
        this.submitPracticeBtnTarget.style.display = "inline-flex"
      }
    })
    .catch(error => console.error("Error checking progress:", error))
  }
}
