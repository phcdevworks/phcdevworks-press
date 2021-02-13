module PhcdevworksPress
  class Article::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => "PhcdevworksPress::ArticlePostVersions"

    # Image Upload
    has_one_attached :article_post_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_press_article_categories_posts", :dependent => :destroy
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true
    belongs_to :link, class_name: "PhcdevworksCoreModules::Affiliate::Link", optional: true

    # Form Fields Validation
    validates :article_post_title,
      presence: true

    validates :article_post_text,
      presence: true

    # Clean URL Define
    friendly_id :list_post_imagearticle_post_nice_urls, use: [:slugged, :finders]

    def list_post_imagearticle_post_nice_urls
      [:article_post_title]
    end

  end
end
