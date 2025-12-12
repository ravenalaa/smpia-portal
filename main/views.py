from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from django.contrib import messages

def login_page(request):
    if request.method == "POST":
        return redirect("dashboard")
    return render(request, "login.html")

def admin_dashboard(request):
    return render(request, "admin_dashboard.html")