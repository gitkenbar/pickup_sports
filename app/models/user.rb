class User < ApplicationRecord
    has_secure_password

    # validations
    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 30}
    validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 255} #format: {URI::MailTo::EMAIL_REGEXP}
    validates :first_name, presence: true
    validates :last_name, presence: true

    # associations
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one :profile, dependent: :destroy
    has_one :location, as: :locationable, dependent: :destroy

    # events the user has created
    has_many :created_events, class_name: 'Event', foreign_key: 'user_id'

    # events the user is participating in
    has_many :event_participants
    has_many :events, through: :event_participants

    #method
    private
    def validate_username
        unless username =~ /\A[a-zA-Z0-9_]+\Z/
            errors.add(:username, "can only contain letters, numbers, and underscores, and must have one letter or number")
        end
    end
end
