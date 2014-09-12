class UserMailer < MandrillMailer::TemplateMailer
  default from: "nick@ideaboard.com"

  def welcome_email(user)
    mandrill_mail template: 'sign-up-notification',
      subject: "Hi and Thanks for Joining IdedBoard",
      from_name: "Nick",
      to: {email: user.email, name: user.username},
      vars: {
        'USER_NAME' => user.username
      },
      important: true,
      inline_css: true,
      async: true,
      track_clicks: true
  end

  def group_join_email(user, group)
    mandrill_mail template: 'group-join-notification',
      subject: "Welcome to #{group.name}",
      from_name: "Nick",
      to: {email: user.email, name: user.username},
      vars: {
        'USER_NAME' => user.username,
        'GROUP_NAME' => group.name
      },
      important: true,
      inline_css: true,
      async: true,
      track_clicks: true
  end
end
