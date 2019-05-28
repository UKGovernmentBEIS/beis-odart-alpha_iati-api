from .models import *
from rest_framework import viewsets,permissions
from iati_expoapi.serialize import *
from rest_framework_xml.parsers import XMLParser
from rest_framework_xml.renderers import XMLRenderer
from django.http import HttpResponse, JsonResponse
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from rest_framework.views import APIView
from rest_framework.response import Response

class ActivitiesSet(viewsets.ModelViewSet):
    queryset=mst_activities.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=ActivitiesSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class ActivitiesjsonSet(viewsets.ModelViewSet):
    queryset=mst_activities.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=ActivitiesSerializer

class POSet(viewsets.ModelViewSet):
    queryset=participating_organisations.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=POSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class POjsonSet(viewsets.ModelViewSet):
    queryset=participating_organisations.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=POSerializer

class SectorsSet(viewsets.ModelViewSet):
    queryset=sectors.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=SectorsSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class SectorsjsonSet(viewsets.ModelViewSet):
    queryset=sectors.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=SectorsSerializer

class BudgetsSet(viewsets.ModelViewSet):
    queryset=budgets.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=BudgetsSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class BudgetjsonSet(viewsets.ModelViewSet):
    queryset=budgets.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=BudgetsSerializer

class TransactionsSet(viewsets.ModelViewSet):
    queryset=transactions.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=TransactionsSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class TransactionsjsonSet(viewsets.ModelViewSet):
    queryset=transactions.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=TransactionsSerializer


class PTSet(viewsets.ModelViewSet):
    queryset=planned_transactions.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=PTSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class PTjsonSet(viewsets.ModelViewSet):
    queryset=planned_transactions.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=PTSerializer

class DLSet(viewsets.ModelViewSet):
    queryset=documents_links.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=DLSerializer
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class DLjsonSet(viewsets.ModelViewSet):
    queryset=documents_links.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=DLSerializer


class AllMixed(viewsets.ModelViewSet):
    queryset=mst_activities.objects.all()
    permission_classes=[
        permissions.AllowAny
    ]
    serializer_class=AllMixed
    parser_classes = (XMLParser,)
    renderer_classes = (XMLRenderer,)

class test(APIView):
    def get(self, request):
        activity_obj = mst_activities.objects.all()
        serializer = ActivitiesSerializer(mst_activities,many=True)
        return Response(serializer.data, safe=False)

    def post(self,request):
        pass