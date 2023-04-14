# Use to send emails, both to members selected from a query screen,
# and to the office administrators.
class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = user
    default_url = edit_reset_password_url(@user.reset_password_token)
    if Rails.env.development?
      part1 = "http://localhost:3000/"
    else
      part1 = "https://shalomcloud.online/"
    end
    start_of_part2 = default_url.index("reset")
    part2 = default_url[start_of_part2, 99]
    @url = part1.concat(part2)
    mail(to: user.email, subject: 'Your password has been reset')
  end
end

