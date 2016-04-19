# coding=utf-8
# --------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from .resource import Resource


class StorageAccountUpdateParameters(Resource):
    """
    The parameters to update on the account.

    :param id: Resource Id
    :type id: str
    :param name: Resource name
    :type name: str
    :param type: Resource type
    :type type: str
    :param location: Resource location
    :type location: str
    :param tags: Resource tags
    :type tags: dict
    :param account_type: Gets or sets the account type. Note that StandardZRS
     and PremiumLRS accounts cannot be changed to other account types, and
     other account types cannot be changed to StandardZRS or PremiumLRS.
     Possible values include: 'Standard_LRS', 'Standard_ZRS', 'Standard_GRS',
     'Standard_RAGRS', 'Premium_LRS'
    :type account_type: str
    :param custom_domain: User domain assigned to the storage account. Name
     is the CNAME source. Only one custom domain is supported per storage
     account at this time. To clear the existing custom domain, use an empty
     string for the custom domain name property.
    :type custom_domain: :class:`CustomDomain
     <fixtures.acceptancetestsstoragemanagementclient.models.CustomDomain>`
    """ 

    _validation = {
        'location': {'required': True},
    }

    _attribute_map = {
        'id': {'key': 'id', 'type': 'str'},
        'name': {'key': 'name', 'type': 'str'},
        'type': {'key': 'type', 'type': 'str'},
        'location': {'key': 'location', 'type': 'str'},
        'tags': {'key': 'tags', 'type': '{str}'},
        'account_type': {'key': 'properties.accountType', 'type': 'AccountType'},
        'custom_domain': {'key': 'properties.customDomain', 'type': 'CustomDomain'},
    }

    def __init__(self, location, id=None, name=None, type=None, tags=None, account_type=None, custom_domain=None):
        super(StorageAccountUpdateParameters, self).__init__(id=id, name=name, type=type, location=location, tags=tags)
        self.account_type = account_type
        self.custom_domain = custom_domain
