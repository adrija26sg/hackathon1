from django.shortcuts import render,redirect
from django.http import HttpResponse,request
from django.contrib.auth.models import User,auth
from .models import transaction

# Create your views here.
def Final_dashboard(request):
    if request.method=='POST':
        emaili=request.POST.get('emaili','')
        passwordi=request.POST.get('passwordi','')
        user=auth.authenticate(emaili=emaili,passwordi=passwordi)
        if user is not None:
            auth.login(request,user)
            return redirect(Final_dashboard)

def signup(request):
    if request.method=='POST':
        email=request.POST.get('email','')
        password=request.POST.get('pass1','')
        print(email, password)
        myuser=User(username="h",email=email,password=password)
        myuser.save()

        return redirect(signup)
    return render(request,"index.html")
def handlesignup(request):
    if request.method=='POST':
        email=request.POST.get['exampleInputEmail1','']
        password=request.POST['exampleInputPassword1']
        print(email, password)

        return redirect(signup)
    else:
        return HttpResponse('Not allowed')

def event(request):
    return render(request,'events.html')


def trans(request):
    if request.method=='POST':
        user1=request.POST.get('user1','')
        user2=request.POST.get('user2','')
        tokenname=request.POST.get('tokenname','')
        tokenamount=request.POST.get('tokenamount','')
        myuser=transaction(user1=user1,user2=user2,tokenname=tokenname,tokenamount=tokenamount)
        myuser.save()

        return redirect(signup)
    return render(request,"Final_dashboard.html.html")
def tokenoncgpa(cgpa):
    return cgpa*10
result=tokenoncgpa(5)    
def token_price():
    orginal=1000
    remainingofth=123
    remainingofdtu=780
    dtu=orginal/remainingofth
    th=orginal/remainingofdtu
def tokens():
     
    return render(request,'Final_dashboard.html')

def event1(request):
  

      
        return render(request,'Final_dashboard.html')

           

