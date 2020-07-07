module PhcdevworksPress
  class Article::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => "PhcdevworksPress::ArticlePostVersions"

    # Image Upload
    has_one_attached :post_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_press_categories_posts"
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true

    # Form Fields Validation
    validates :post_title,
      presence: true

    validates :post_text,
      presence: true

    # Clean URL Define
    friendly_id :phcdev_article_post_nice_urls, use: [:slugged, :finders]

    def phcdev_article_post_nice_urls
      [:post_title]
    end

  end
end
