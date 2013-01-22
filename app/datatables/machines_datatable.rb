class MachinesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Machine.count,
      iTotalDisplayRecords: machines.total_entries,
      aaData: data
    }
  end

private

  def data
    machines.map do |machine|
      [
        link_to(machine.id_number, machine),
        h(machine.stock_number),
        h(machine.workshop_id),
        h(machine.kind_name),
        h(machine.name),
        h(machine.initial_id),
        h(machine.make),
        h(machine.country_name),
        h(machine.year_of_production),
        number_to_currency(machine.price, unit: '')
      ]
    end
  end
  
  def machines
    @machines ||= fetch_machines
  end

  def fetch_machines
    machines = Machine.order("#{sort_column} #{sort_direction}")
    machines = machines.page(page).per_page(per_page)
    if params[:sSearch].present?
      machines = machines.where(
        "machines.id_number like :search or 
        machines.stock_number like :search or 
        machines.name like :search or 
        machines.initial_id like :search or 
        machines.make like :search or 
        machines.year_of_production like :search or 
        machines.price like :search", 
        search: "%#{params[:sSearch]}%"
      )
    end
    machines
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id_number stock_number workshop_id kind_id name initial_id make country_id year_of_production price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end