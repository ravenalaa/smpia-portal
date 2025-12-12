from django.urls import path
from main.views import login_page, admin_dashboard

app_name = 'main'

urlpatterns = [
    path("", login_page, name="login"),
    path("dashboard/", admin_dashboard, name="dashboard"),
]