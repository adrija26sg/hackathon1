from django.contrib import admin
from django.urls import path
from .import views
urlpatterns=[
    path('signup',views.signup,name='search'),
    path('events',views.event,name='event'),
    path('event1',views.event1,name='event1')
    # path('login',views.login,name="login")
    # path(,views.handlesignup,name="search")

]