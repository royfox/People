class PersonMailer < ActionMailer::Base
  default from: "recruitment@footballradar.com"
  
  
  
  def test1(person)
    @person = person #for the view
    @quiz_url = "http://www.footballradar.com/quiz/"
    @csv_url = "http://www.footballradar.com/data/premier-league/09-10.csv"
    mail(:to => @person.email, :subject => "Concerning test with Football Radar: #{@person.name}", :body => "Hello #{@person.name}")
  end


  def email(person, subject, body)
    @person = person #for the view
    #@body = body.html_safe
    mail(:to => @person.email, :subject => subject, :body => wrap(body), :content_type => "text/html")
  end





  private
  def wrap(body)
    header = "<!DOCTYPE html>
      <html>
        <head>
          <meta content=\"text/html; charset=UTF-8\" http-equiv=\"Content-Type\" />
        </head>
        <body>"
    footer = "</body></html>"
    body = "#{header}#{body}#{footer}"
    return body
  end
    
end
