class CreateSeoKeywordsJob < ApplicationJob
  queue_as :default

  def perform(keyword:, user_prompt:, system_prompt:, response_schema:)
    keywords = Ai::Openai::ChatGptService.new.call(
      user_prompt: user_prompt,
      system_prompt: system_prompt,
      response_schema: response_schema
    )
    keywords["keywords"].each do |lt_keyword|
      lt_keyword["long_tail_keywords"].each do |term|
        Keyword.find_or_create_by(
          name: term,
          is_long_tail: true,
          pillar: keyword
        )
      end
    end
  end
end