Capistrano::DSL.stages.each do |stage|
  after stage, "check:local_branch"
end

namespace :check do
  task :local_branch do
    next if fetch(:skip_local_branch_check)

    expected_local_branch = fetch(:local_branch) || fetch(:branch) || raise("Please set `local_branch` or `branch`")
    actual_local_branch = `git symbolic-ref --short HEAD`.strip

    unless actual_local_branch == expected_local_branch
      warn("=" * 80)
      warn("!!! Local branch `#{actual_local_branch}` maybe wrong. Please `git checkout #{expected_local_branch}`. !!!")
      warn("=" * 80)
      exit 1
    end
  end
end
