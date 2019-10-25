module PhcdevworksPress
  class Article::Category < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksPress::CategoryVersions'

    # Relationships
    has_and_belongs_to_many :posts, class_name: 'Article::Post', :join_table => 'phcdevworks_press_categories_posts', :dependent => :destroy
    belongs_to :user, class_name: 'PhcdevworksAccounts::User'

    # Form Fields Validation
    validates :category_name,
      presence: true,
      uniqueness: true

    # Clean URL Define
    friendly_id :phcdev_article_category_nice_urls, use: [:slugged, :finders]

    def phcdev_article_category_nice_urls
      [:category_name]
    end

  end
end
