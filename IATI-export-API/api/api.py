from models import *
from rest_framework import viewsets,permissions
from serializer import *
from rest_framework_xml.parsers import XMLParser
from rest_framework_xml.renderers import XMLRenderer

class ActivitiesSet(viewsets.ModelViewSet):
    queryset=mst_activities.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=ActivitiesSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)


class POSet(viewsets.ModelViewSet):
    queryset=participating_organisations.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=POSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class SectorsSet(viewsets.ModelViewSet):
    queryset=sectors.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=SectorsSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class BudgetsSet(viewsets.ModelViewSet):
    queryset=budgets.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=BudgetsSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class TransactionsSet(viewsets.ModelViewSet):
    queryset=transactions.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=TransactionsSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class PTSet(viewsets.ModelViewSet):
    queryset=planned_transactions.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=PTSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class DLSet(viewsets.ModelViewSet):
    queryset=documents_links.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=DLSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)


