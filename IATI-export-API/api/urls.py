from rest_framework import routers
from .api import *

router=routers.DefaultRouter()
router.register('api/activities', ActivitiesSet, 'activities')
router.register('api/participating_organisations', POSet,'participating_organisations')
router.register('api/sectors', SectorsSet, 'sectors')
router.register('api/budgets', BudgetsSet, 'budgets')
router.register('api/transactions', TransactionsSet, 'transactions')
router.register('api/planned_transactions',PTSet, 'planned_transactions')
router.register('api/documents_links', DLSet, 'documents_links')
urlpatterns=router.urls