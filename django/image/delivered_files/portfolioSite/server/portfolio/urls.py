from django.conf.urls import url
from django.urls import path
from portfolio import views

# Template tagging
app_name = 'portfolio'

urlpatterns = [
    path('', views.portfolioHome, name='portfolioHome'),
]
