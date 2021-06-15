python -m pip install --upgrade pip
if [ -f requirements.txt ]; then pip install -r requirements.txt --target ./lambda/terraform/module/python; fi
cp -R ./lambda/*.py ./lambda/terraform/module/python/
cp -R ./migrations ./lambda/terraform/module/python/
cp -R ./shared_db_app ./lambda/terraform/module/python/      
