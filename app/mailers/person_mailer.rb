class PersonMailer < ActionMailer::Base
  default from: "recruitment@footballradar.com"
  
  
  
  def test1(person)
    @person = person #for the view
    @quiz_url = "http://www.footballradar.com/quiz/"
    @csv_url = "http://www.footballradar.com/data/premier-league/09-10.csv"
    mail(:to => @person.email, :subject => "Concerning test with Football Radar: #{@person.name}")
  end
  
    
end
