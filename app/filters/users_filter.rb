class UsersFilter
  class << self
    # Recupera todos os usuários, aplicando filtros se fornecidos
    def retrieve_all(filters = {})
      users = User.all
      apply_filters(users, filters)
    end

    # Busca um usuário por ID
    def find_by_id(id)
      User.find_by(id: id)
    end

    private

    # Aplica os filtros dinamicamente
    def apply_filters(users, filters)
      users = filter_by_name(users, filters[:name]) if filters[:name].present?
      users = filter_by_email(users, filters[:email]) if filters[:email].present?
      users = filter_by_role(users, filters[:role]) if filters[:role].present?
      users
    end

    # Filtro por nome
    def filter_by_name(users, name)
      users.where("name LIKE ?", "%#{name}%")
    end

    # Filtro por email
    def filter_by_email(users, email)
      users.where("email LIKE ?", "%#{email}%")
    end

    # Filtro por role
    def filter_by_role(users, role)
      users.where(role: role)
    end
  end
end
