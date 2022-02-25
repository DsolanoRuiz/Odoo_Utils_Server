###############################################################
#  Odoo Instance Generation 
###############################################################

VERSION= "v14"
BRANCH="14.0"

# cd /opt/odoo/$BRANCH/oca_repos

#We make a git clone of all the OCA repositories we want to use in Oca_Repos:
git clone -b $BRANCH https://github.com/OCA/account-financial-reporting.git
git clone -b $BRANCH https://github.com/OCA/server-tools.git
git clone -b $BRANCH https://github.com/OCA/stock-logistics-workflow.git
git clone -b $BRANCH https://github.com/OCA/stock-logistics-barcode.git
git clone -b $BRANCH https://github.com/OCA/web.git
git clone -b $BRANCH https://github.com/OCA/product-attribute.git
git clone -b $BRANCH https://github.com/OCA/project-service.git
git clone -b $BRANCH https://github.com/OCA/crm.git
git clone -b $BRANCH https://github.com/OCA/partner-contact.git
git clone -b $BRANCH https://github.com/OCA/l10n-spain.git
git clone -b $BRANCH https://github.com/OCA/stock-logistics-warehouse.git
git clone -b $BRANCH https://github.com/OCA/website.git
git clone -b $BRANCH https://github.com/OCA/bank-payment.git
git clone -b $BRANCH https://github.com/OCA/bank-statement-import.git
git clone -b $BRANCH https://github.com/OCA/account-financial-tools.git
git clone -b $BRANCH https://github.com/OCA/stock-logistics-transport.git
git clone -b $BRANCH https://github.com/OCA/stock-logistics-tracking.git
git clone -b $BRANCH https://github.com/OCA/reporting-engine.git
git clone -b $BRANCH https://github.com/OCA/report-print-send.git
git clone -b $BRANCH https://github.com/OCA/department.git
git clone -b $BRANCH https://github.com/OCA/carrier-delivery.git
git clone -b $BRANCH https://github.com/OCA/manufacture.git
git clone -b $BRANCH https://github.com/OCA/e-commerce.git
git clone -b $BRANCH https://github.com/OCA/sale-workflow.git
git clone -b $BRANCH https://github.com/OCA/account-analytic.git
git clone -b $BRANCH https://github.com/OCA/pos.git
git clone -b $BRANCH https://github.com/OCA/social.git
git clone -b $BRANCH https://github.com/OCA/account-payment.git
git clone -b $BRANCH https://github.com/OCA/hr-timesheet.git
git clone -b $BRANCH https://github.com/OCA/hr.git
git clone -b $BRANCH https://github.com/OCA/account-fiscal-rule.git
git clone -b $BRANCH https://github.com/OCA/account-invoicing.git
git clone -b $BRANCH https://github.com/OCA/rma.git
git clone -b $BRANCH https://github.com/OCA/product-variant.git
git clone -b $BRANCH https://github.com/OCA/bank-payment.git
git clone -b $BRANCH https://github.com/OCA/delivery-carrier.git
git clone -b $BRANCH https://github.com/OCA/survey.git
git clone -b $BRANCH https://github.com/OCA/vertical-association.git
git clone -b $BRANCH https://github.com/OCA/purchase-workflow.git
git clone -b $BRANCH https://github.com/OCA/multi-company.git
git clone -b $BRANCH https://github.com/OCA/project.git
git clone -b $BRANCH https://github.com/OCA/management-system.git
git clone -b $BRANCH https://github.com/OCA/knowledge.git
git clone -b $BRANCH https://github.com/OCA/geospatial.git
git clone -b $BRANCH https://github.com/OCA/crm.git
git clone -b $BRANCH https://github.com/OCA/contract.git
git clone -b $BRANCH https://github.com/OCA/connector-telephony.git
git clone -b $BRANCH https://github.com/OCA/commission.git
git clone -b $BRANCH https://github.com/OCA/bank-statement-reconcile.git
git clone -b $BRANCH https://github.com/OCA/account-invoice-reporting.git
git clone -b $BRANCH https://github.com/OCA/account-closing.git
git clone -b $BRANCH https://github.com/OCA/account-budgeting.git
git clone -b $BRANCH https://github.com/OCA/account-financial-reporting.git
git clone -b $BRANCH https://github.com/OCA/donation.git
git clone -b $BRANCH https://github.com/OCA/event.git
git clone -b $BRANCH https://github.com/OCA/report-print-send.git
git clone -b $BRANCH https://github.com/OCA/operating-unit.git
git clone -b $BRANCH https://github.com/OCA/stock-logistics-reporting.git
git clone -b $BRANCH https://github.com/OCA/sale-financial.git
git clone -b $BRANCH https://github.com/OCA/margin-analysis.git
git clone -b $BRANCH https://github.com/OCA/webkit-tools.git
git clone -b $BRANCH https://github.com/OCA/sale-reporting.git
git clone -b $BRANCH https://github.com/OCA/purchase-reporting.git
git clone -b $BRANCH https://github.com/OCA/project-reporting.git
git clone -b $BRANCH https://github.com/OCA/manufacture-reporting.git
git clone -b $BRANCH https://github.com/OCA/server-auth.git
git clone -b $BRANCH https://github.com/OCA/data-protection.git
git clone -b $BRANCH https://github.com/OCA/mis-builder.git
git clone -b $BRANCH https://github.com/OCA/apps-store.git
git clone -b $BRANCH https://github.com/OCA/geospatial.git
git clone -b $BRANCH https://github.com/OCA/server-backend.git
git clone -b $BRANCH https://github.com/OCA/server-ux.git
git clone -b $BRANCH https://github.com/OCA/management-system.git
git clone -b $BRANCH https://github.com/OCA/credit-control.git
git clone -b $BRANCH https://github.com/OCA/rest-framework.git
git clone -b $BRANCH https://github.com/OCA/community-data-files.git
git clone -b $BRANCH https://github.com/OCA/server-brand.git


#We change the permissions
chown odoo:odoo /opt/odoo* -R 			#chown odoo:odoo /opt/odoo/v15 -R
