from rest_framework import serializers
from models import *

class ActivitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model=mst_activities
        fields='__all__'

class POSerializer(serializers.ModelSerializer):
    class Meta:
        model=participating_organisations
        fields='__all__'
class SectorsSerializer(serializers.ModelSerializer):
    class Meta:
        model=sectors
        fields='__all__'

class SectorsSerializer(serializers.ModelSerializer):
    class Meta:
        model=sectors
        fields='__all__'

class BudgetsSerializer(serializers.ModelSerializer):
    class Meta:
        model=budgets
        fields='__all__'

class BudgetsSerializer(serializers.ModelSerializer):
    class Meta:
        model=budgets
        fields='__all__'



class TransactionsSerializer(serializers.ModelSerializer):
    class Meta:
        model=transactions
        fields='__all__'

class PTSerializer(serializers.ModelSerializer):
    class Meta:
        model=planned_transactions
        fields='__all__'

class PTSerializer(serializers.ModelSerializer):
    class Meta:
        model=planned_transactions
        fields='__all__'

class DLSerializer(serializers.ModelSerializer):
    class Meta:
        model=documents_links
        fields='__all__'
    







