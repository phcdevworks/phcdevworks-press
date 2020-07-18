module PhcdevworksPress
  class Review::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => "PhcdevworksPress::ReviewPostVersions"

    # Image Upload
    has_one_attached :review_post_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_press_review_categories_posts", :dependent => :destroy
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true

    # Form Fields Validation
    validates :review_post_title,
      presence: true

    validates :review_post_text,
      presence: true

    # Clean URL Define
    friendly_id :article_review_nice_urls, use: [:slugged, :finders]

    def article_review_nice_urls
      [:review_post_text]
    end

  end
end
