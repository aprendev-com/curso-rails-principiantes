class ProductPolicy < BasePolicy
  def edit
    record.owner?
  end

  def update
    record.owner?
  end

  def destroy
    record.owner?
  end
end
