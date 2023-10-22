class ContactMailer < ApplicationMailer
  def contact_mail(blog)
 
    @blog = blog
    user_email = @blog.user.email
    mail to: user_email, subject: "お問い合わせの確認メール"
  end
end

