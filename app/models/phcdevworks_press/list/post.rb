module PhcdevworksPress
  class List::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => "PhcdevworksPress::ListPostVersions"

    # Image Upload
    has_one_attached :list_post_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    has_many :items, class_name: "PhcdevworksPress::List::Item", :dependent => :destroy
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_press_list_categories_posts", :dependent => :destroy
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true

    # Form Fields Validation
    validates :list_post_title,
      presence: true

    validates :list_post_text,
      presence: true

    # Clean URL Define
    friendly_id :list_post_nice_urls, use: [:slugged, :finders]

    def list_post_nice_urls
      [:list_post_title]
    end

  end
end
