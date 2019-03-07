# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Board.create([
#              {code_board:'CD-01',board_model: 'basic'},
#              {code_board:'CD-02',board_model: 'medium'},
#              {code_board:'CD-03',board_model: 'expert'}
#])

ProjectState.create([
              {name:'inactivo'},
              {name:'activo'},
              {name:'finalizado'}
])

Unit.create([
              {name: 'Unidad 1', index_order: 1},
              {name: 'Unidad 2', index_order: 2},
              {name: 'Unidad 3', index_order: 3},
              {name: 'Unidad 4', index_order: 4},
              {name: 'Unidad 5', index_order: 5},
              {name: 'Finalizado', index_order: 6}
])

Role.create([
              {name: 'Admin', role_type: RoleType.create(name: 'Atix')},
              {name: 'Usuario', role_type: RoleType.create(name: 'User')}
])

board_model=BoardModel.create(name: 'Básico')

Board.create([

              {code_board:'CD-01',board_model: board_model}
])

