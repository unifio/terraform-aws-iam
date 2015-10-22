require 'rake'

inputs = {
}

task :default => :verify

desc "Verify the stack"
task :verify do

  vars = []
  inputs.each() do |var, value|
    vars.push("-var #{var}=\"#{value}\"")
  end

  ['volume_manager_role', 'flow_log_role', 'volume_admin_user', 'volume_admin_group'].each do |stack|
    task_args = {:stack => stack, :args => vars.join(' ')}
    Rake::Task['clean'].execute(Rake::TaskArguments.new(task_args.keys, task_args.values))
    Rake::Task['plan'].execute(Rake::TaskArguments.new(task_args.keys, task_args.values))
  end
end

desc "Remove existing local state if present"
task :clean, [:stack] do |t, args|
  sh "cd examples/#{args['stack']} && rm -fr .terraform *.tfstate*"
end

desc "Create execution plan"
task :plan, [:stack, :args] do |t, args|
  sh "cd examples/#{args['stack']} && terraform get && terraform plan -module-depth=-1 -input=false #{args['args']}"
end
