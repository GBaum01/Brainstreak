import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "submit", "answer", "explanation", "explainButton", "result", "submitPracticeBtn", "submittedAnswer", "submittedAnswerText", "error"]

  connect() {
    this.answered = false
    this.toggleSubmitButton()
  }

  submit(event) {
    event.preventDefault()
    if (this.answered) return

    const user = this.inputTarget.value.trim()
    const numberPattern = /^[-+]?(?:\d+\.?\d*|\.\d+)$/

    if (!numberPattern.test(user)) {
      this.errorTarget.style.display = "block"
      return
    }

    this.errorTarget.style.display = "none"
    this.answered = true

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

      const nextQuestionUrl = this.data.get("next-question-url")
      const practiceId = this.data.get("practice-id")
      if (nextQuestionUrl && nextQuestionUrl !== "") {
        // advance immediately without showing the submitted answer UI
        window.location = nextQuestionUrl
        return
      }

      // If there's no next question, this is the final question.
      // Submit the whole practice and go straight to the recap page.
      if ((!nextQuestionUrl || nextQuestionUrl === "") && practiceId) {
        fetch(`/practices/${practiceId}/submit`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
          }
        })
        .then(() => {
          window.location = `/practices/${practiceId}/recap`
        })
        .catch(err => {
          console.error('Error submitting practice:', err)
          // fallback: show submitted-answer UI
        })
        return
      }

      this.resultTarget.textContent = isCorrect ? "Correct!" : "Incorrect"
      this.resultTarget.style.display = "block"
      this.resultTarget.classList.toggle("text-emerald-600", isCorrect)
      this.resultTarget.classList.toggle("text-rose-600", !isCorrect)

      this.submittedAnswerTextTarget.textContent = user
      this.submittedAnswerTarget.style.display = "block"
      this.formTarget.style.display = "none"

      this.answerTarget.style.display = "block"
      this.explainButtonTarget.style.display = "inline-flex"

      // Check if all questions are answered (only relevant on final question)
      this.checkAllAnswered()
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

  toggleSubmitButton() {
    if (this.answered) return

    const value = this.inputTarget.value.trim()
    const hasValue = value.length > 0

    if (this.hasSubmitTarget) {
      this.submitTarget.disabled = !hasValue
      this.submitTarget.classList.toggle("opacity-50", !hasValue)
      this.submitTarget.classList.toggle("cursor-not-allowed", !hasValue)
      this.submitTarget.classList.toggle("cursor-pointer", hasValue)
    }
  }
}
