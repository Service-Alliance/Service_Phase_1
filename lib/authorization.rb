module AuthPolicy

  def self.included(base)
    base.before_filter :my_before_filter
  end

  def my_before_filter
    if current_user.contractor?
      redirect_to "/"
    end
  end

end
