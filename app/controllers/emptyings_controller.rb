class EmptyingsController < ApplicationController
  before_action :set_emptying, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /emptyings
  # GET /emptyings.json
  def index
    @emptyings = Emptying.order("created_at DESC")
    @emptying = Emptying.new
    @sent_reminders = Notification.where( created_by_id: current_user.id )
    @last_sent_reminder = Time.now - 48.hours
    if @sent_reminders.length > 0
      @last_sent_reminder = @sent_reminders.last.created_at 
    end
    @notification = Notification.new unless @last_sent_reminder > ( Time.now - 24.hours )

    @next = Emptying.next_user( Emptying.last.user.id )
  end

  # GET /emptyings/1
  # GET /emptyings/1.json
  def show
  end

  # GET /emptyings/new
  def new
    @emptying = Emptying.new
  end

  # GET /emptyings/1/edit
  def edit
  end

  # POST /emptyings
  # POST /emptyings.json
  def create
    @emptying = Emptying.new(emptying_params)
    @emptying.user_id = current_user.id
    next_user = Emptying.next_user( current_user.id )
    Notification.notify( next_user, "It's your turn to empty the dishes, #{ next_user.name }! #{current_user.name} just emptied!")

    respond_to do |format|
      if @emptying.save
        format.html { redirect_to '/', notice: 'Emptying was successfully created.' }
        format.json { render :show, status: :created, location: @emptying }
      else
        format.html { render :new }
        format.json { render json: @emptying.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emptyings/1
  # PATCH/PUT /emptyings/1.json
  def update
    respond_to do |format|
      if @emptying.update(emptying_params)
        format.html { redirect_to @emptying, notice: 'Emptying was successfully updated.' }
        format.json { render :show, status: :ok, location: @emptying }
      else
        format.html { render :edit }
        format.json { render json: @emptying.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emptyings/1
  # DELETE /emptyings/1.json
  def destroy
    @emptying.destroy
    respond_to do |format|
      format.html { redirect_to emptyings_url, notice: 'Emptying was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emptying
      @emptying = Emptying.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emptying_params
      params.require(:emptying).permit(:user_id)
    end
end
