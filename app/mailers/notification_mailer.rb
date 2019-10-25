class NotificationMailer < ApplicationMailer
    default from: "no-reply@nomsterapp.com"

    def comment_added
        mail(to: "dankyoger@gmail.com",
            subjet: "A Comment has been added to your place")
    end
end
