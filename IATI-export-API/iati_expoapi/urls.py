from django.urls import path, include
from rest_framework import routers
from rest_framework.routers import DefaultRouter
from .api import *
from iati_expoapi import views

router=routers.DefaultRouter()
router.register('api/activities', ActivitiesSet, 'activities')
router.register('api/participating_organisations', POSet,'participating_organisations')
router.register('api/sectors', SectorsSet, 'sectors')
router.register('api/budgets', BudgetsSet, 'budgets')
router.register('api/transactions', TransactionsSet, 'transactions')
router.register('api/planned_transactions',PTSet, 'planned_transactions')
router.register('api/documents_links', DLSet, 'documents_links')
router.register('api/all_mixed',AllMixed,'all_mixed')
router.register('api/activity_json',ActivitiesjsonSet,'activities_json')
router.register('api/participating_organisations_json',POjsonSet,'participating_organisations_json')
router.register('api/sectors_json',SectorsjsonSet,'sectors_json')
router.register('api/budgets_json',BudgetjsonSet,'budgets_json')
router.register('api/transactions_json',TransactionsjsonSet,'transactions_json')
router.register('api/planned_transactions_json',PTjsonSet,'planned_transactions_json')
router.register('api/documents_links_json',DLjsonSet,'documents_links_json')

urlpatterns=router.urls


urlpatterns = [
    path('', include(router.urls)),
    #path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('snippets/', views.data_list),
    path('tt/', views.tt),
]