
class PeopleController < ApplicationController
  before_filter :login_required
  
  
  # GET /people
  # GET /people.json
  def index
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
    mailtype = params[:mailtype]
    logger.debug "mailtype: #{mailtype}"


    email_template = EmailTemplate.find(1)
    erb = ERB.new(email_template.body)

    PersonMailer.email(@person, email_template.subject, erb.result(binding)).deliver

    #if mailtype == 2
     # PersonMailer.test1(@person).deliver
    # elsif mailtype == 2
    #   PersonMailer.test2(@person).deliver
    # elsif mailtype == 3
    #   PersonMailer.rejected(@person).deliver
    #end
    
    @comment = @person.comments.new
    @comment.body = "Test 999 email delivered"
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html { redirect_to @person, notice: 'Test 1 email was successfully sent' }
      format.json { head :no_content }
    end   
  end
  
  
  def state
    @person = Person.find(params[:id])
    @person.state_id = params[:state_id]

    if @person.save
      render :partial => "state#{@person.state_id}", :layout => false
    end
  end
  
end
