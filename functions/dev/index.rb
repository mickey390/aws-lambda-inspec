require 'bundler/setup'
require 'inspec'

def lambda_handler(event: "test", context: "test")

	# opts = { 'target' => "aws://", 'reporter' => ['html:/tmp/output.html']}
	opts = { 'target' => "aws://"}
	r = Inspec::Runner.new(opts)
	r.add_target("spec")
	r.run

end

lambda_handler()