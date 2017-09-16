class CollectionSubscriptionsController < ApplicationController
  before_action :set_collection_subscription, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  def create
    @collection_subscription = CollectionSubscription.new(collection_subscription_params)
    @collection_subscription.job_id = @job.id

    respond_to do |format|
      if @collection_subscription.save
        UserMailer.collections_user_added_to_job(@collection_subscription.user, @job).deliver_later
        format.html { redirect_to job_path(@job), notice: 'Collection Department User was successfully added.' }
        format.json { render :show, status: :created, location: @collection_subscription }
      else
        format.html { redirect_to job_path(@job), notice: 'There was an error adding a Collection Department User.' }
        format.json { render json: @collection_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @collection_subscription.update(collection_subscription_params)
        format.html { redirect_to job_collection_subscription_path(@job, @collection_subscription), notice: 'Collection Department User was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_subscription }
      else
        format.html { render :edit }
        format.json { render json: @collection_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @collection_subscription.destroy
    respond_to do |format|
      format.html { redirect_to job_path(@job), notice: 'Sales Rep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_collection_subscription
      @collection_subscription = CollectionSubscription.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    def collection_subscription_params
      params.require(:collection_subscription).permit(:user_id, :job_id)
    end
end
