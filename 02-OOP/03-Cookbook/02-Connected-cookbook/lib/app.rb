require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'
require_relative 'display'
require_relative 'recipe'

CSV_FILE = File.join(File.dirname(__FILE__), 'recipes.csv')
cookbook = Cookbook.new(CSV_FILE)
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run
