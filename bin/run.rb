require_relative '../config/environment'
require_relative '../lib/models/CLI_model.rb'

cli = CommandLineInterface.new
viewer = cli.greet 

# cli.main_screen()
# cli.make_a_review(viewer)



