# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from models import *

# Register your models here.
admin.site.register(mst_activities)
admin.site.register(participating_organisations)
admin.site.register(sectors)
admin.site.register(budgets)
admin.site.register(transactions)
admin.site.register(planned_transactions)
admin.site.register(documents_links)