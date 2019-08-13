module PhcdevworksPress
  class Article::Category < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksPress::CategoryVersions'

    # Relationships
    has_and_belongs_to_many :posts, class_name: 'Article::Post', :join_table => 'categories_posts', :dependent => :destroy
    belongs_to :user, class_name: 'PhcdevworksAccounts::User'

    # Form Fields Validation
    validates :category_name,
      presence: true,
      uniqueness: true

    # Clean URL Define
    friendly_id :phc_nice_url_slug, use: [:slugged, :finders]

    def phc_nice_url_slug
      [:category_name]
    end

  end
end
