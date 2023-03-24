# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создать новый #{question.test.title} вопрос"
    else
      "Редактировать #{question.test.title} вопрос"
    end
  end
end
