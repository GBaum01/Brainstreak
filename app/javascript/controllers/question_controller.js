import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "form",
    "input",
    "explainButton",
    "explanation",
    "result",
    "submitPracticeBtn",
    "submittedAnswer",
    "submittedAnswerText",
    "actionBtn",
    "nextQuestionBtn",
    "answer"
  ]

  connect() {
    this.answered = false
  }

  submit(event) {
    event.preventDefault()
    if (this.answered) return

    const user = this.inputTarget.value.trim()
    if (!user) return

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
      this.resultTarget.classList.toggle("text-emerald-600", isCorrect)
      this.resultTarget.classList.toggle("text-rose-600", !isCorrect)

      this.submittedAnswerTextTarget.textContent = user
      this.submittedAnswerTarget.style.display = "block"
      this.formTarget.style.display = "none"

      this.answerTarget.style.display = "block"
      this.explainButtonTarget.style.display = "inline-flex"

      // Dynamically update the main action button text and style
      if (this.hasNextQuestionBtnTarget) {
        this.actionBtnTarget.textContent = "Next Question"
        this.actionBtnTarget.type = "button"
      } else {
        this.actionBtnTarget.textContent = "Submit Practice"
        this.actionBtnTarget.type = "button"
        this.actionBtnTarget.classList.remove("bg-indigo-600", "hover:bg-indigo-500", "focus-visible:outline-indigo-600")
        this.actionBtnTarget.classList.add("bg-emerald-600", "hover:bg-emerald-500", "focus-visible:outline-emerald-600")
      }
    })
    .catch(error => console.error("Error submitting answer:", error))
  }

  handleAction(event) {
    if (!this.answered) return

    event.preventDefault()

    if (this.hasNextQuestionBtnTarget) {
      this.nextQuestionBtnTarget.click()
    } else {
      this.submitPracticeBtnTarget.click()
    }
  }

  showExplanation() {
    const isHidden = this.explanationTarget.style.display === "none"
    this.explanationTarget.style.display = isHidden ? "block" : "none"
  }
}
