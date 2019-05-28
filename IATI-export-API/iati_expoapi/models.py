# Create your models here.
from django.db import models
import datetime
from django import forms
from django.conf import settings
from django.forms import ModelForm
from django.forms import CharField, Textarea, MultipleChoiceField, ChoiceField, Select, RadioSelect, ModelChoiceField, \
    DecimalField, DateTimeField, IntegerField, DateField, TextInput


class mst_activities(models.Model):
    mst_activity_id = models.AutoField(primary_key=True)
    identifier = models.CharField(max_length=250, unique=True, null=False, blank=False)
    title = models.TextField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    activity_status_code = models.IntegerField(null=True, blank=True)
    actual_activity_start_date_type = models.IntegerField(null=True, blank=True)
    planned_activity_start_date = models.DateField(null=True, blank=True)
    planned_activity_start_date_type=models.IntegerField(null=True,blank=True)
    actual_activity_start_date = models.DateField(null=True, blank=True)
    actual_activity_end_date_type = models.IntegerField(null=True, blank=True)
    planned_activity_end_date = models.DateField(null=True, blank=True)
    planned_activity_end_date_type = models.IntegerField(null=True, blank=True)
    actual_activity_end_date = models.DateField(null=True, blank=True)
    recipient_country_name = models.CharField(max_length=250, null=True, blank=True)
    recipient_country_code = models.CharField(max_length=250, null=True, blank=True)
    recipient_region_code = models.IntegerField(null=True, blank=True)
    recipient_region_vocabulary_code = models.IntegerField(null=True, blank=True)
    sector_name = models.CharField(max_length=250, null=True, blank=True)
    sector_code = models.CharField(max_length=250, null=True, blank=True)
    recipient_region= models.CharField(max_length=250, null=True, blank=True)
    humanitarian_flag = models.CharField(max_length=250, null=True, blank=True)
    collaboration_type_code = models.IntegerField(null=True, blank=True)
    flow_type_code = models.IntegerField(null=True, blank=True)
    finance_type_code = models.IntegerField(null=True, blank=True)
    aid_type_code = models.CharField(max_length=250, null=True, blank=True)
    tied_status_code = models.CharField(max_length=250, null=True, blank=True)
    other_identifier_reference = models.CharField(max_length=250, null=True, blank=True)
    other_identifier_type = models.CharField(max_length=250, null=True, blank=True)
    reporting_organisation_identifier = models.TextField(null=True, blank=True)
    reporting_organisation_type_code = models.TextField(null=True, blank=True)
    reporting_organisation_name = models.TextField(null=True, blank=True)
    contact_type = models.TextField(null=True, blank=True)
    contact_organisation = models.TextField(null=True, blank=True)
    directorate = models.TextField(null=True, blank=True)
    programme = models.TextField(null=True, blank=True)
    contact_email = models.TextField(null=True, blank=True)
    contact_website = models.TextField(null=True, blank=True)
    mailing_address = models.TextField(null=True, blank=True)
    default_currency = models.TextField(null=True, blank=True)
    last_updated = models.DateField(null=True, blank=True)
    conditions=models.TextField(null=True, blank=True)
    condition_document_title=models.TextField(null=True, blank=True)
    condition_document_format=models.TextField(null=True, blank=True)
    Condition_document_link=models.TextField(null=True, blank=True)
    Condition_document_category=models.TextField(null=True, blank=True)
    capital_spend=models.TextField(null=True, blank=True)

    @property
    def participating_organisations(self):
        return self.po_identifier_id_identifier_id.all()

    @property
    def sectors(self):
        return self.sectors_identifier_id_identifier_id.all()

    @property
    def budgets(self):
        return self.budgets_identifier_identifier_id.all()

    @property
    def transactions(self):
        return self.transactions_identifier_id_identifier_id.all()

    @property
    def planned_transactions(self):
        return self.identifier_id_identifier_id.all()

    @property
    def documents_links(self):
        return self.documents_links_id_identifier_id.all()


class participating_organisations(models.Model):
    po_identifier_id = models.AutoField(primary_key=True)
    activity_identifier = models.ForeignKey('mst_activities', related_name='po_identifier_id_identifier_id', null=False,
                                            blank=False, to_field="identifier",on_delete=models.CASCADE)  # String FK
    participating_organisation_role_code = models.IntegerField(null=True, blank=True)
    participating_organisation_name = models.CharField(max_length=250, null=True, blank=True)
    participating_organisation_id = models.CharField(max_length=250, null=True, blank=True)
    participating_organisation_type_code = models.IntegerField(null=True, blank=True)


class sectors(models.Model):
    sectors_identifier_id = models.AutoField(primary_key=True)
    activity_identifier = models.ForeignKey('mst_activities', related_name='sectors_identifier_id_identifier_id',
                                            null=False, blank=False, to_field="identifier",on_delete=models.CASCADE)
    sector_name = models.TextField(null=True, blank=True)
    sector_code = models.TextField(null=True, blank=True)
    sector_percentage = models.IntegerField(null=True, blank=True)
    sector_vocabulary = models.TextField(null=True, blank=True)


class budgets(models.Model):
    budgets_identifier_id = models.AutoField(primary_key=True)
    activity_identifier = models.ForeignKey('mst_activities', related_name='budgets_identifier_identifier_id',
                                            null=False, blank=False, to_field="identifier",on_delete=models.CASCADE)
    budget_type_code = models.IntegerField(null=True, blank=True)
    budget_period_start_date = models.DateField(null=True, blank=True)
    budget_currency = models.TextField(null=True, blank=True)
    budget_period_end_date = models.DateField(null=True, blank=True)
    budget_value = models.DecimalField(max_digits=250, decimal_places=2)
    budget_value_date = models.DateField(null=True, blank=True)
    budget_status_code = models.IntegerField(null=True, blank=True)


class transactions(models.Model):
    transactions_identifier_id = models.AutoField(primary_key=True)
    activity_identifier = models.ForeignKey('mst_activities', related_name='transactions_identifier_id_identifier_id',
                                            null=False, blank=False, to_field="identifier",on_delete=models.CASCADE)
    transaction_value = models.CharField(max_length=250, null=True, blank=True)
    transaction_currency = models.DecimalField(max_digits=250, decimal_places=2)
    transaction_value_date = models.DateField(null=True, blank=True)
    transaction_date = models.DateField(null=True, blank=True)
    transaction_description = models.TextField(null=True, blank=True)
    transaction_type_code = models.CharField(max_length=250, null=True, blank=True)
    transaction_provider_organisation_name = models.TextField(null=True, blank=True)
    transaction_provider_organisation_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_provider_organisation_activity_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_receiver_organisation_name = models.TextField(null=True, blank=True)
    transaction_receiver_organisation_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_receiver_organisation_activity_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_relevant_quarter= models.TextField(null=True, blank=True)



class planned_transactions(models.Model):
    planned_transactions = models.AutoField(primary_key=True)
    activity_identifier = models.ForeignKey('mst_activities', related_name='identifier_id_identifier_id', null=False,
                                            blank=False, to_field="identifier",on_delete=models.CASCADE)  # String FK
    planned_disbursement_type_code = models.CharField(max_length=250, null=True, blank=True)
    planned_disbursement_value = models.CharField(max_length=250, null=True, blank=True)
    transaction_currency = models.DecimalField(max_digits=250, decimal_places=2)
    planned_disbursement_value_date = models.DateField(null=True, blank=True)
    planned_disbursement_period_start = models.CharField(max_length=250, null=True, blank=True)
    planned_disbursement_period_end = models.CharField(max_length=250, null=True, blank=True)
    planned_disbursement_provider_organisation_name = models.TextField(null=True, blank=True)
    transaction_provider_organisation_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_provider_organisation_activity_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_receiver_organisation_name = models.TextField(null=True, blank=True)
    transaction_receiver_organisation_id = models.CharField(max_length=250, null=True, blank=True)
    transaction_receiver_organisation_activity_id = models.CharField(max_length=250, null=True, blank=True)
    relevant_quarter=models.TextField(null=True, blank=True)


class documents_links(models.Model):
    documents_links_id = models.AutoField(primary_key=True)
    activity_identifier = models.ForeignKey('mst_activities', related_name='documents_links_id_identifier_id',
                                            null=False, blank=False, to_field="identifier",on_delete=models.CASCADE)
    Title = models.TextField(null=True, blank=True)
    Category = models.TextField(null=True, blank=True)
    Language = models.TextField(null=True, blank=True)
    Date = models.DateField(null=True, blank=True)
    URL = models.TextField(null=True, blank=True)
    Format = models.TextField(null=True, blank=True)