
In progress...
***

### Simple Django site with PostgreSQL integration.
All inside Docker containers.  

***

#### First time site creation:
1. Install Docker: 
    https://docs.docker.com/engine/installation/linux/ubuntu/

2. Install Docker Compose: 
    https://docs.docker.com/compose/install/

3. Create new project: 
    `docker-compose run web django-admin.py startproject simple_site .`

4. Set permissions for a new project:
    `sudo chown -R $USER:$USER ./site`

5. Configure DB settings:    
    ```
    site/simple_site/settings.py

    DATABASES = {
     'default': {
         'ENGINE': 'django.db.backends.postgresql',
         'NAME': 'postgres',
         'USER': 'postgres',
         'HOST': 'db',
         'PORT': 5432,
     }
    }
    ```
6. Start containers:
    `docker-compose up`

7. Open your site:
    [http://localhost:8000/](http://localhost:8000/)


***

#### Clean up:
1. Shut down containers with `CONTROL-C`
2. Stop containers: `docker-compose down)`
2. Stop containers: 
    ```
    docker stop $(docker ps -a -q) ; docker rm $(docker ps -a -q) ; docker rmi -f $(docker images -a -q)
    ```
3. Delete files: `sudo rm -rf site/simple_site/ site/manage.py`

To run *only* Code Style checks:
```bash
sudo pip install -U pip setuptools virtualenv
virtualenv --clear .venv && source .venv/bin/activate
pip install -U -r requirements.txt

flake8 site/
pylint site/
```
