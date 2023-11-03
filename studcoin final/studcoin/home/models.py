from django.db import models

# Create your models here.
class user(models.Model):
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=100)
    email=models.EmailField(max_length=128)   
    university_name=models.CharField(max_length=50)
    age=models.IntegerField()
    sex=models.CharField( max_length=50)
    grad_year=models.IntegerField()
    thapar_tokens=models.IntegerField()
    dtu_tokens=models.IntegerField()
class token(models.Model):
    token_name=models.CharField(max_length=50)
    initial_supply=models.IntegerField()
    mined_tokens=models.IntegerField()
class events(models.Model):
    event_name=models.CharField( max_length=50)        
    event_date=models.DateField( auto_now=False, auto_now_add=False)
    event_time=models.TimeField( auto_now=False, auto_now_add=False)
    nooftickets=models.IntegerField()
    ticket_price=models.IntegerField()
class transaction(models.Model):
    token_amount=models.IntegerField()
    user_1=models.CharField( max_length=50)
    user_2=models.CharField( max_length=50)
    token_name=models.CharField(max_length=50)