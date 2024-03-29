# frozen_string_literal: true

class ProfileBlueprint < Blueprinter::Base
    identifier: id
    fields :bio 

    view :normal do
        fields :username
    end

    view :profile do
        association :location, blueprint: LocationBlueprint
        association :posts, blueprint: PostBlueprint, view: :profile do |user, options|
            user.posts.order(create_at: :desc).limit(5)
        end

        association :events, blueprint: EventBlueprint, view: :profile do |user, options|
            user.events.order(start_date_time: :desc_).limit(5)
        end
    end
end
