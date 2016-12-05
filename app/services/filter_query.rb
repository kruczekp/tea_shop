class FilterQuery

  def initialize scope, filters
    @scope = scope.all
    @filters = filters.to_h.select { |_, v| v.present? }
    @order = @filters.delete('order') || 'created_at_desc'
  end

  def call
    @filters
      .inject(@scope) { |scope, (k, v)| scope.where(interpret_filter(k.to_s, v)) }
      .order(interpret_order)
  end

  private

  def interpret_filter k, v
    if k.ends_with? '_from'
      ["#{k.chomp('_from')} >= ?", v]
    elsif k.ends_with? '_to'
      ["#{k.chomp('_to')} <= ?", v]
    else
      {k => v}
    end
  end

  def interpret_order
    i = @order.rindex('_')
    "#{@order[0...i]} #{@order[i+1..-1].upcase}"
  end
end