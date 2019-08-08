from django.shortcuts import render

# Create your views here.
def portfolioHome(request):
    return render(request,'portfolio/portfolioHome.html',{})
