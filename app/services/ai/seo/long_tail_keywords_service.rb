class Ai::Seo::LongTailKeywordsService < BaseService
  def call(keyword)
    CreateSeoKeywordsJob.perform_later(
      keyword: keyword,
      user_prompt: user_prompt(keyword),
      system_prompt: system_prompt,
      response_schema: response_schema
    )
  end

  def response_schema
    {
      "strict": true,
      "name": "SEO_keywords_generator",
      "description": "Generate 20 long tail keywords for the given keyword.",
      "schema": {
        "type": "object",
        "properties": {
          "keywords": {
            "type": "array",
            "description": "Array of objects, each containing a keyword and a list of 20 long tail keywords.",
            "items": {
              "type": "object",
              "properties": {
                "long_tail_keywords": {
                  "type": "array",
                  "description": "An array of 20 long tail keywords for the given keyword.",
                  "items": {
                    "type": "string"
                  }
                }
              },
              "required": ["long_tail_keywords"], # Make both keyword and terms required
              "additionalProperties": false
            }
          }
        },
        "required": ["keywords"], # Make long_tail_keywords required
        "additionalProperties": false
      }
    }
  end

  def user_prompt(keyword)
    <<~PROMPT
      Generate 20 long tail keywords for the given keyword: #{keyword}.
    PROMPT
  end

  def system_prompt
    <<~PROMPT
      You are an expert in SEO and content writing. Your task is to generate SEO-optimized content for a given keyword. 
    PROMPT
  end

end