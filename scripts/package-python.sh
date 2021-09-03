python -m pip install --upgrade pip
pip install -r ./requirements.txt --target ./lambda/terraform/module/python
cp -R ./lambda/*.py ./lambda/terraform/module/python/
cp -R ./migrations ./lambda/terraform/module/python/
cp -R ./shared_db_app ./lambda/terraform/module/python/      
