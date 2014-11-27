class Shoutout < ActiveRecord::Base
  validates :host_id, :visitor_id, :text, presence: true

  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id"
end
