from django.contrib import admin
from home.models import user
from home.models import token
from home.models import events
from home.models import transaction
# Register your models here.
admin.site.register(user)
admin.site.register(token)
admin.site.register(events)
admin.site.register(transaction)