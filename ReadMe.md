python -m venv venv
source ./venv/bin/activate
python -m pip install dbt-core dbt-postgres
pip install --upgrade pip
dbt init

https://stackoverflow.com/a/59444831/20242
brew install libpq
brew link --force libpq

(venv) paulrule@192-168-1-229 spike % dbt init
01:33:16  Running with dbt=1.8.4
Enter a name for your project (letters, digits, underscore): spike
01:33:20  
Your new dbt project "spike" was created!

For more information on how to configure the profiles.yml file,
please consult the dbt documentation here:

https://docs.getdbt.com/docs/configure-your-profile

One more thing:

Need help? Don't hesitate to reach out to us via GitHub issues or on Slack:

https://community.getdbt.com/

Happy modeling!

01:33:20  Setting up your profile.
Which database would you like to use?
[1] postgres

(Don't see the one you want? https://docs.getdbt.com/docs/available-adapters)

Enter a number: 1
host (hostname for the instance): localhost
port [5432]:
user (dev username): postgres
pass (dev password):
dbname (default database that dbt will build objects in): postgres
schema (default schema that dbt will build objects in): public
threads (1 or more) [1]:
01:42:12  Profile spike written to /Users/paulrule/.dbt/profiles.yml using target's profile_template.yml and your supplied values. Run 'dbt debug' to validate the connection.
(venv) paulrule@192-168-1-229 spike % cd spike
(venv) paulrule@192-168-1-229 spike % dbt run
01:42:36  Running with dbt=1.8.4
01:42:36  Registered adapter: postgres=1.8.2
01:42:36  Unable to do partial parsing because saved manifest not found. Starting full parse.
01:42:37  Found 2 models, 4 data tests, 417 macros
01:42:37  
01:42:37  Concurrency: 1 threads (target='dev')
01:42:37  
01:42:37  1 of 2 START sql table model public.my_first_dbt_model ......................... [RUN]
01:42:37  1 of 2 OK created sql table model public.my_first_dbt_model .................... [SELECT 2 in 0.09s]
01:42:37  2 of 2 START sql view model public.my_second_dbt_model ......................... [RUN]
01:42:37  2 of 2 OK created sql view model public.my_second_dbt_model .................... [CREATE VIEW in 0.04s]
01:42:37  
01:42:37  Finished running 1 table model, 1 view model in 0 hours 0 minutes and 0.40 seconds (0.40s).
01:42:37  
01:42:37  Completed successfully
01:42:37  
01:42:37  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2
