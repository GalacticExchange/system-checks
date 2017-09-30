
namespace :mysync do
  namespace :shared do
    task :commit_server do
      on roles(:app) do
        execute "cd #{shared_path} && git add -A . && git commit -m \"server changes \" " rescue true
        execute "cd #{shared_path} && git push origin production-shared " rescue true
      end
    end
    task :update_server do
      on roles(:app) do
        execute "cd #{shared_path} && git pull origin production-shared " rescue true
      end
    end


    task :pull do
      on roles(:app) do
        #call cap production mysync:commit_server_shared

        #call cd ../site_production_shared

        #call git checkout production-shared
        #call git pull origin production-shared

        #execute "cd #{shared_path} && git pull origin production-shared " rescue true
      end
    end

  end




end
