
class PeopleController < ApplicationController
  before_filter :login_required
  
  
  # GET /people
  # GET /people.json
  def index
    @roles = Role.all
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @states = State.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new
    2.times { @person.documents.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
    2.times { @person.documents.build }
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
 
  def sendmail
    @person = Person.find(params[:id])
    email_template = params[:email_template]

    email_template = EmailTemplate.find(email_template)
    erb = ERB.new(email_template.body)

    PersonMailer.email(@person, email_template.subject, erb.result(binding)).deliver
  end
  
  
  def state
    @person = Person.find(params[:id])
    @person.state_id = params[:state_id]

    if @person.save
      if params[:email_template]
        sendmail
        addComment("State changed to <i>#{@person.state.name}</i> and <a href=\"/email_templates/#{params[:email_template]}\">email</a> is delivered")
        respond_to do |format|
          format.html { redirect_to @person, notice: "State changed to #{@person.state.name} and email was successfully sent" }
          format.json { head :no_content }
        end
      else
        addComment("State changed to <i>#{@person.state.name}</i>")
        respond_to do |format|
          format.html { redirect_to @person, notice: 'State is changed' }
          format.json { head :no_content }
        end

      end
    end
  end
  


  private 
  def addComment(body)
    @comment = @person.comments.new
    @comment.body = body
    @comment.user = current_user
    @comment.save
  end


end
