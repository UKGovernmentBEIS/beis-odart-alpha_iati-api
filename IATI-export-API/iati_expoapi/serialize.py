from rest_framework import serializers
from iati_expoapi.models import *


class ActivitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = mst_activities
        fields = '__all__'


class POSerializer(serializers.ModelSerializer):
    class Meta:
        model = participating_organisations
        fields = '__all__'


class SectorsSerializer(serializers.ModelSerializer):
    class Meta:
        model = sectors
        fields = '__all__'


class SectorsSerializer(serializers.ModelSerializer):
    class Meta:
        model = sectors
        fields = '__all__'


class BudgetsSerializer(serializers.ModelSerializer):
    class Meta:
        model = budgets
        fields = '__all__'


class BudgetsSerializer(serializers.ModelSerializer):
    class Meta:
        model = budgets
        fields = '__all__'


class TransactionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = transactions
        fields = '__all__'


class PTSerializer(serializers.ModelSerializer):
    class Meta:
        model = planned_transactions
        fields = '__all__'


class PTSerializer(serializers.ModelSerializer):
    class Meta:
        model = planned_transactions
        fields = '__all__'


class DLSerializer(serializers.ModelSerializer):
    class Meta:
        model = documents_links
        fields = '__all__'


class AllMixed(serializers.ModelSerializer):
    participating_organisations = POSerializer(many=True)
    sectors = SectorsSerializer(many=True)
    budgets = BudgetsSerializer(many=True)
    transactions = TransactionsSerializer(many=True)
    planned_transactions = PTSerializer(many=True)
    documents_links = DLSerializer(many=True)

    class Meta:
        model = mst_activities
        fields = ['mst_activity_id',
                  'identifier',
                  'title',
                  'description',
                  'activity_status_code',
                 
                  'actual_activity_start_date_type',
                  'planned_activity_start_date',
                  'actual_activity_start_date',
                  'actual_activity_end_date_type',
                  'planned_activity_end_date',
                  'planned_activity_end_date_type',
                  'actual_activity_end_date',
                  'recipient_country_name',
                  'recipient_country_code',
                  'recipient_region_code',
                  'recipient_region_vocabulary_code',
                  'sector_name',
                  'sector_code',
                  'humanitarian_flag',
                  'collaboration_type_code',
                  'flow_type_code',
                  'finance_type_code',
                  'aid_type_code',
                  'tied_status_code',
                  'other_identifier_reference',
                  'other_identifier_type',
                  'reporting_organisation_identifier',
                  'reporting_organisation_type_code',
                  'reporting_organisation_name',
                  'contact_type',
                  'contact_organisation',
                  'directorate',
                  'programme',
                  'contact_email',
                  'contact_website',
                  'mailing_address',
                  'default_currency',
                  'last_updated',
                  'participating_organisations',
                  'sectors',
                  'budgets',
                  'transactions',
                  'planned_transactions',
                  'documents_links'
                  ]



#