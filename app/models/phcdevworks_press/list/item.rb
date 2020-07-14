module PhcdevworksPress
  class List::Item < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => "PhcdevworksPress::ListItemVersions"

    # Image Upload
    has_one_attached :list_item_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    belongs_to :post, class_name: "PhcdevworksPress::List::Post"
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_press_categories_posts"
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true

    # Form Fields Validation
    validates :list_item_title,
      presence: true

    validates :list_item_text,
      presence: true

    # Clean URL Define
    friendly_id :list_item_nice_urls, use: [:slugged, :finders]

    def list_item_nice_urls
      [:list_item_title]
    end

  end
end
