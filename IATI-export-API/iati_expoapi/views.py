from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from rest_framework_xml.parsers import XMLParser
from rest_framework_xml.renderers import XMLRenderer
from iati_expoapi.serialize import *
from iati_expoapi.models import *
from django.conf import settings
from django.core import serializers
import xml.etree.ElementTree as ET
import datetime

def data_list(request):
    if request.method == 'GET':
        snippets = mst_activities.objects.all()
        serializer = ActivitiesSerializer(snippets, many=True)
        return JsonResponse(serializer.data, safe=False)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = ActivitiesSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)

def tt(request):
    #data = serializers.serialize("xml", mst_activities.objects.all())
    name_of_file='mst_activities'
    activity_objects=mst_activities.objects.all()
    fields=list(mst_activities._meta.get_fields())
    column_list=[k.name for k in fields]
    #print("++++++++++++++++++++++",column_list)
    root = ET.Element('iati-activities',generated_datetime=datetime.datetime.now().strftime("%d/%m/%y"+" "+"%X"),version="1")
    for object in activity_objects:


        identifier=ET.SubElement(root,'iati-activity',name="iati-activity",default_currency=str(object.default_currency),humanitarian=str(object.humanitarian_flag),last_updated_datetime=str(object.last_updated))

        ET.SubElement(identifier, 'iati-identifier').text = str(object.identifier)
        reporting_org=ET.SubElement(identifier,'reporting-org',ref=str(object.reporting_organisation_identifier), type=str(object.reporting_organisation_type_code))
        
        ET.SubElement(reporting_org, 'narrative').text = str(object.reporting_organisation_name)


        title=ET.SubElement(identifier,'title')
        ET.SubElement(title, 'narrative').text = str(object.title)
        description=ET.SubElement(identifier,'description')
        ET.SubElement(description, 'narrative').text = str(object.description)
        ET.SubElement(identifier, 'activity_status',code=str(object.activity_status_code))
        ET.SubElement(identifier, 'actual_activity_start_date',iso_code=str(object.actual_activity_start_date), type= str(object.actual_activity_start_date_type))
        ET.SubElement(identifier, 'actual_activity_end_date',iso_code=str(object.actual_activity_end_date), type=str(object.actual_activity_end_date_type))
        ET.SubElement(identifier, 'planned_activity_start_date',iso_code=str(object.planned_activity_start_date), type= str(object.planned_activity_start_date_type))
        ET.SubElement(identifier, 'plnned_activity_end_date',iso_code=str(object.planned_activity_end_date),type= str(object.planned_activity_end_date_type))
       
        contact_info=ET.SubElement(identifier,'contact-info', type=str(object.contact_type))
        contact_organisation=ET.SubElement(contact_info,'contact-organisation')
        ET.SubElement(contact_organisation, 'narrative').text = str(object.contact_organisation)
        ET.SubElement(contact_info, 'contact-mail').text = str(object.contact_email)
        ET.SubElement(contact_info, 'contact-website').text = str(object.contact_website)
        mailing_address=ET.SubElement(contact_info,'mailing-address')
        ET.SubElement(mailing_address, 'narrative').text = str(object.mailing_address)

        

        
        recipient_country=ET.SubElement(identifier,'recipient_country')
        ET.SubElement(recipient_country,'narrative').text=str(object.recipient_country_name)
        sector=ET.SubElement(identifier,'sector', code=str(object.sector_code))
        ET.SubElement(sector, 'collaboration_type',code=str(object.collaboration_type_code))
        ET.SubElement(sector, 'default-finance_type',code=str(object.finance_type_code))
        ET.SubElement(sector, 'default-aid_type',code=str(object.aid_type_code))
        ET.SubElement(sector, 'default-tied_status',code=str(object.tied_status_code))

       
        for j in object.budgets_identifier_identifier_id.all():
            budget=ET.SubElement(identifier,'budget', status=str(j.budget_status_code),type=str(j.budget_type_code))
            ET.SubElement(budget, 'value', currency=str(j.budget_currency)).text = str(j.budget_value)
        

        for j in object.identifier_id_identifier_id.all():
            planned_disbursement=ET.SubElement(identifier,'planned-disbursement')

            ET.SubElement(planned_disbursement, 'period-start', iso_date=str(j.planned_disbursement_period_start))
            ET.SubElement(planned_disbursement, 'period-end', iso_date=str(j.planned_disbursement_period_end))
            ET.SubElement(planned_disbursement, 'value', currency=str(j.transaction_currency),value_date=str(j.planned_disbursement_value_date)).text=str(j.planned_disbursement_value)
            provider_org=ET.SubElement(planned_disbursement,'provider-org', provider_activity_id=str(j.transaction_provider_organisation_activity_id),ref=str(j.transaction_provider_organisation_id))
            ET.SubElement(provider_org ,'narrative').text=j.planned_disbursement_provider_organisation_name 



        ET.SubElement(identifier, 'capital_spend',code=str(object.capital_spend))




        for j in object.transactions_identifier_id_identifier_id.all():
            transaction=ET.SubElement(identifier,'transaction')

            ET.SubElement(transaction,'transaction_date', iso_date=str(j.transaction_date))
            ET.SubElement(transaction,'value', currency=str(j.transaction_currency),value_date=str(j.transaction_value_date)).text=j.transaction_value
            description=ET.SubElement(transaction,'description')
            ET.SubElement(description,'narrative').text=str(j.transaction_description)
            provider_org=ET.SubElement(transaction,'provider-org', provider_activity_id=str(j.transaction_provider_organisation_activity_id),ref=str(j.transaction_provider_organisation_id))
            ET.SubElement(provider_org,'narrative').text=str(j.transaction_receiver_organisation_name)
        
        ET.SubElement(identifier,'conditions', attached=str(object.conditions))


        '''
            ET.SubElement(transactions, 'transaction_currency').text = str(j.transaction_currency)
            ET.SubElement(transactions, 'transaction_value_date').text = str(j.transaction_value_date)
            ET.SubElement(transactions, 'transaction_date').text = str(j.transaction_date)
            ET.SubElement(transactions, 'transaction_description').text = str(j.transaction_description)
            ET.SubElement(transactions, 'transaction_type_code').text = str(j.transaction_type_code)
            ET.SubElement(transactions, 'transaction_provider_organisation_name').text = str(j.transaction_provider_organisation_name)
            ET.SubElement(transactions, 'transaction_provider_organisation_id').text = str(j.transaction_provider_organisation_id)
            ET.SubElement(transactions, 'transaction_provider_organisation_activity_id').text = str(j.transaction_provider_organisation_activity_id)
            ET.SubElement(transactions, 'transaction_receiver_organisation_name').text = str(j.transaction_receiver_organisation_name)
            ET.SubElement(transactions, 'transaction_receiver_organisation_id').text = str(j.transaction_receiver_organisation_id)
            ET.SubElement(transactions, 'transaction_receiver_organisation_activity_id').text = str(j.transaction_receiver_organisation_activity_id)
            ET.SubElement(transactions, 'transaction_relevant_quarter').text = str(j.transaction_relevant_quarter)
            ## Delete or comment the rest ##
        ET.SubElement(identifier, 'recipient_region_vocabulary_code').text = str(object.recipient_region_vocabulary_code)
        ET.SubElement(identifier, 'sector_name').text = str(object.sector_name)
        ET.SubElement(identifier, 'recipient_region_code').text = str(object.sector_code)
        ET.SubElement(identifier, 'recipient_region_vocabulary_code').text = str(object.recipient_region)
        ET.SubElement(identifier, 'humanitarian_flag').text = str(object.humanitarian_flag)
        ET.SubElement(identifier, 'collaboration_type_code').text = str(object.collaboration_type_code)
        ET.SubElement(identifier, 'flow_type_code').text = str(object.flow_type_code)
        ET.SubElement(identifier, 'finance_type_code').text = str(object.finance_type_code)
    
        ET.SubElement(identifier, 'aid_type_code').text = str(object.aid_type_code)
        ET.SubElement(identifier, 'tied_status_code').text = str(object.tied_status_code)
        ET.SubElement(identifier, 'other_identifier_reference').text = str(object.other_identifier_reference)
        ET.SubElement(identifier, 'other_identifier_type').text = str(object.other_identifier_type)
        
        #ET.SubElement(identifier, 'contact_type').text = str(object.contact_type)
        
        ET.SubElement(identifier, 'contact_organisation').text = str(object.contact_organisation)
        ET.SubElement(identifier, 'directorate').text = str(object.directorate)
        ET.SubElement(identifier, 'programme').text = str(object.programme)
        ET.SubElement(identifier, 'contact_email').text = str(object.contact_email)
        ET.SubElement(identifier, 'contact_website').text = str(object.contact_website)
        ET.SubElement(identifier, 'mailing_address').text = str(object.mailing_address)
        #ET.SubElement(identifier, 'default_currency').text = str(object.default_currency)
        #ET.SubElement(identifier, 'last_updated').text = str(object.last_updated)
        ET.SubElement(identifier, 'conditions').text = str(object.conditions)
        ET.SubElement(identifier, 'condition_document_title').text = str(object.condition_document_title)
        ET.SubElement(identifier, 'condition_document_format').text = str(object.condition_document_format)
        ET.SubElement(identifier, 'Condition_document_link').text = str(object.Condition_document_link)
        ET.SubElement(identifier, 'Condition_document_category').text = str(object.Condition_document_category)
        ET.SubElement(identifier, 'capital_spend').text = str(object.capital_spend)





        ############### Creating parent for all participating organisations ################
        participating_organisations=ET.SubElement(identifier,'Participating_Organisations')
        ################ Creating children for participating organisations ###########
        for j in object.po_identifier_id_identifier_id.all():
            ET.SubElement(participating_organisations,'participating_organisation_identifier').text=str(j.po_identifier_id)
            ET.SubElement(participating_organisations, 'activity_identifier').text = str(j.activity_identifier)
            ET.SubElement(participating_organisations, 'participating_organisation_role_code').text = str(j.participating_organisation_role_code)
            ET.SubElement(participating_organisations, 'participating_organisation_name').text = str(j.participating_organisation_name)
            ET.SubElement(participating_organisations,'participating_organisation_id').text=str(j.participating_organisation_id)
            ET.SubElement(participating_organisations, 'participating_organisation_type_code').text = str(j.participating_organisation_type_code)



                        ############ Add more columns here accordingly ###########
        
        
        ############### Creating parent for all sectors ################
        sectors=ET.SubElement(identifier,'sectors')
        ################ Creating children for sectors ###########
        for j in object.sectors_identifier_id_identifier_id.all():
            ET.SubElement(sectors,'activity_identifier').text=str(j.activity_identifier)
            ET.SubElement(sectors, 'sector_name').text = str(j.sector_name)
            ET.SubElement(sectors, 'sector_code').text = str(j.sector_code)
            ET.SubElement(sectors,'sector_percentage').text=str(j.sector_percentage)
            ET.SubElement(sectors, 'sector_vocabulary').text = str(j.sector_vocabulary)

                        ############ Add more columns here accordingly ###########
        
        
        ############### Creating parent for all budgets ################
        budgets=ET.SubElement(identifier,'budgets')
        ################ Creating children for budgets ###########
        for j in object.budgets_identifier_identifier_id.all():
            ET.SubElement(budgets,'activity_identifier').text=str(j.activity_identifier)
            ET.SubElement(budgets, 'budget_type_code').text = str(j.budget_type_code)
            ET.SubElement(budgets, 'budget_period_start_date').text = str(j.budget_period_start_date)
            ET.SubElement(budgets, 'budget_currency').text = str(j.budget_currency)
            ET.SubElement(budgets, 'budget_period_end_date').text = str(j.budget_period_end_date)
            ET.SubElement(budgets, 'budget_value').text = str(j.budget_value)
            ET.SubElement(budgets, 'budget_value_date').text = str(j.budget_value_date)
            ET.SubElement(budgets, 'budget_status_code').text = str(j.budget_status_code)

            ############ Add more columns here accordingly ###########
        
        
        ############### Creating parent for all transactions################
        transactions=ET.SubElement(identifier,'transactions')
        ################ Creating children for transactions ###########
        for j in object.transactions_identifier_id_identifier_id.all():
            ET.SubElement(transactions,'transaction_value').text=str(j.transaction_value)
            ET.SubElement(transactions, 'transaction_currency').text = str(j.transaction_currency)
            ET.SubElement(transactions, 'transaction_value_date').text = str(j.transaction_value_date)
            ET.SubElement(transactions, 'transaction_date').text = str(j.transaction_date)
            ET.SubElement(transactions, 'transaction_description').text = str(j.transaction_description)
            ET.SubElement(transactions, 'transaction_type_code').text = str(j.transaction_type_code)
            ET.SubElement(transactions, 'transaction_provider_organisation_name').text = str(j.transaction_provider_organisation_name)
            ET.SubElement(transactions, 'transaction_provider_organisation_id').text = str(j.transaction_provider_organisation_id)
            ET.SubElement(transactions, 'transaction_provider_organisation_activity_id').text = str(j.transaction_provider_organisation_activity_id)
            ET.SubElement(transactions, 'transaction_receiver_organisation_name').text = str(j.transaction_receiver_organisation_name)
            ET.SubElement(transactions, 'transaction_receiver_organisation_id').text = str(j.transaction_receiver_organisation_id)
            ET.SubElement(transactions, 'transaction_receiver_organisation_activity_id').text = str(j.transaction_receiver_organisation_activity_id)
            ET.SubElement(transactions, 'transaction_relevant_quarter').text = str(j.transaction_relevant_quarter)


                        ############ Add more columns here accordingly ###########
        
        
        ############### Creating parent for all planned_transactions ################
        planned_transactions=ET.SubElement(identifier,'planned_transactions')
        ################ Creating children for planned_transactions ###########
        for j in object.identifier_id_identifier_id.all():
            ET.SubElement(planned_transactions,'planned_transactions').text=str(j.planned_transactions)
            ET.SubElement(planned_transactions, 'planned_disbursement_type_code').text = str(j.planned_disbursement_type_code)
            ET.SubElement(planned_transactions, 'planned_disbursement_value').text = str(j.planned_disbursement_value)
            ET.SubElement(planned_transactions, 'transaction_currency').text = str(j.transaction_currency)
            ET.SubElement(planned_transactions, 'planned_disbursement_value_date').text = str(j.planned_disbursement_value_date)
            ET.SubElement(planned_transactions, 'planned_disbursement_period_start').text = str(j.planned_disbursement_period_start)
            ET.SubElement(planned_transactions, 'planned_disbursement_period_end').text = str(j.planned_disbursement_period_end)
            ET.SubElement(planned_transactions, 'transaction_receiver_organisation_name').text = str(j.transaction_receiver_organisation_name)
            ET.SubElement(planned_transactions, 'planned_disbursement_value_date').text = str(j.planned_disbursement_provider_organisation_name)
            ET.SubElement(planned_transactions, 'planned_disbursement_period_start').text = str(j.transaction_provider_organisation_id)
            ET.SubElement(planned_transactions, 'planned_disbursement_period_end').text = str(j.transaction_provider_organisation_activity_id)
            ET.SubElement(planned_transactions, 'transaction_receiver_organisation_id').text = str(j.transaction_receiver_organisation_id)
            ET.SubElement(planned_transactions, 'transaction_receiver_organisation_activity_id').text = str(j.transaction_receiver_organisation_activity_id)
            ET.SubElement(planned_transactions, 'relevant_quarter').text = str(j.relevant_quarter)

            ############ Add more columns here accordingly ###########

        
        ############### Creating parent for all documents_links ################
        documents_links=ET.SubElement(identifier,'documents_links')
        ################ Creating children for documents_links ###########
        for j in object.identifier_id_identifier_id.all():
            ET.SubElement(documents_links,'documents_links').text=str(j.documents_links_id)
            ET.SubElement(documents_links, 'Title').text = str(j.Title)
            ET.SubElement(documents_links, 'Category').text = str(j.Category)
            ET.SubElement(documents_links, 'Language').text = str(j.Language)
            ET.SubElement(documents_links, 'Date').text = str(j.Date)
            ET.SubElement(documents_links, 'URL').text = str(j.URL)
                        ############ Add more columns here accordingly ###########
                        '''
    mydata = ET.tostring(root)
    #mydata=str(data)
    file_path = settings.MEDIA_ROOT+'try.xml'
    FilePointer = open(file_path, "wb")
    FilePointer.write(mydata)
    FilePointer=open(file_path,"r")
    response = HttpResponse(FilePointer, content_type='application/xml')
    response['Content-Disposition'] = 'attachment; filename=All.xml'
    #print("-------------",FilePointer)
    return response
    #
