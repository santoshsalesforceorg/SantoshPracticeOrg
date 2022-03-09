public with sharing class TestApex {
    public TestApex() {
/* 

•	How we can call integration procedure from apex : vlocity_cmt.IntegrationProcedureService.runIntegrationService(procedureName, ipInput, ipOptions);
•	How to call integration procedure from flow : create a Salesforce Flow component by defining a class. Class must be invocable.
•	IP  are synchronous bydefault & run them asynchronously we need to enable chaining.
•	Vlocity Templates are of 2 types: Document & web template.
 
•	IntegrationProcedureService : Its implementation supports integration procedures. IG is an OmniScript that runs OmniScript Actions as a headless service (lacking a user interface) available through JavaScript or an Apex service.
•	runIntegrationService(): Invokes an Integration Procedure and returns its data. Arguments:
1.       ipKey — Specifies the Integration Procedure to invoke in Type_Subtype format.
2.       input — Specifies the input in Map<String, Object> format.
3.       isDebug — Returns additional information that is helpful for debugging. Optional.
•	runIntegrationProcedureServiceFromApex():Invokes an Integration Procedure and returns its data. Ignores Sharing Rules and Custom Permissions, which ensures that the Integration Procedure is private. Arguments same as above.
•	runIntegrationServiceFuture(): Invokes an Integration Procedure as if a @future annotation were applied. Returns no data (void). Arguments: Input- Specifies the input in JSON string format.
•	runIntegrationProcedureQueueable() : Invokes an Integration Procedure as a Queueable Apex Job for asynchronous processing. Returns the ID of the Queueable job.
 
•	IP invocation using POST: To post JSON data to an Integration Procedure, issue a POST call. You can also include inline values, query parameters, and a JSON request body. To pass input data in a POST call, you can specify either a JSON request body or URL parameters.              /services/apexrest/{namespace}/v1/integrationprocedure/{Type}_{SubType}/
 
•	Data Raptor calls from apex: To call a DataRaptor from apex, call the vlocity_ins.DRGlobal.processObjectsJSON() method, specifying the name of the DataRaptor and the input data that it requires. Specify the input as follows:
1.       For a JSON object, use Map<String, Object>. Set the String to the JSON key and the Object to the JSON value.
2.       For an array of JSON objects, use List<Map<String, Object>>. Set the String to the JSON key and the Object to the JSON value.
3.       As an alternative, you can specify the input as a string containing the JSON input required by the DataRaptor.
 
 
•	Integration Procedure : Vlocity Integration Procedures are declarative, server-side processes that execute multiple actions in a single server call. Integration procedures can read and write data from Salesforce and from external systems (using REST calls) and can call Apex code. An Integration Procedure can be called from an OmniScript, an API, or an Apex method, and can be a data source for a Vlocity Card. Integration Procedures are optimal when you need to access and transform data from third-party sources and no user interaction is required, and moving the workload from client to server is desirable.
 
•	When to use IR:
a.       You need to both read from and write to one or more SObjects, which means you need to call at least two DataRaptors.
b.       The SObjects you need to read from and/or write to have no defined relationship.
c.       Transforming your data can't be done using formulas alone. For example, different conditions determine whether some filtering or calculations are performed at all.
d.       JSON node mappings aren't straightforward and/or require a series of steps.
e.       You need to read from or write to multiple data source types, such as SObjects, CSV files, external objects, Apex classes, and so on.
f.        You need to perform actions such as calling a REST API, sending an email, merging lists, handling errors, and so on.
 
•	Integration Procedure best practice :
1.       Use Integration Procedures for all data calls to Salesforce.
2.       Use multiple Response Actions with different Execution Conditional Formulas to allow an Integration Procedure to exit early under appropriate conditions.
3.       To run data operations asynchronously, call Integration Procedures using these settings
a.       Use Future — Use when the calling OmniScript or Integration Procedure doesn't need a response and completion time is not critical.
b.       Invoke Mode: Fire and Forget — Use instead of Use Future when the calling OmniScript must invoke the Integration Procedure immediately.
c.       Invoke Mode: Non-Blocking — Use to run the Integration Procedure immediately while continuing the user interaction of the calling OmniScript. A response is returned when the Integration Procedure is complete.
 
•	Difference between DR & IP : Data Raptors read or write Salesforce SObject data or perform single-step data transformations. Integration Procedures can interact with many types of data and process it in multiple steps. For some use cases, a single DataRaptor is sufficient. Integration Procedures usually call one or more DataRaptors and are more flexible and powerful.
 
•	Data Raptor : A DataRaptor is a mapping tool that enables you to read, transform, and write Salesforce data. There are four types of DataRaptor: Turbo Extract, Extract, Transform, and Load. DataRaptors typically supply data to OmniScripts, Integration Procedures, and Cards, and write updates from OmniScripts, Integration Procedures, and Cards to Salesforce.
** Although Apex classes can read, write, and transform data, they take longer to create and are harder to maintain than DataRaptors. Therefore, use of DataRaptors is a best practice.**
 
•	When to use DR:
a.       You need to read data from SObjects or write data to SObjects, but not both.
b.       You need to access data from 2 Sobject which are in a defined relationship. Like Account & Contact.
c.       You only need to work with JSON or XML data. No SObjects are involved.
d.       You can perform any needed filtering, calculation, or reformatting of data values using one or a series of formulas.
e.       You can make any needed changes to the data structure by mapping input JSON nodes to output JSON nodes.
 
•	DR best Practices:
a.       Try to keep the number of SObjects to three or fewer.
b.       Use relationship notation (queries) whenever possible to pull data from other SObjects.
c.       Create targeted DataRaptors that only extract or load the data needed for one operation.
 
•	Cards: The Vlocity Cards Framework provides tools for building customer-centric, industry-specific UI components and applications on the Salesforce platform. Cards are rich in information and actions relevant to the customer's context. Create your cards in a declarative design tool and add them to your Lightning or Community pages, or to an application outside Salesforce. Cards consists of “Actions” & “States”.
 
•	Card State : You can customize each card via its state to display various clickable actions, information, and/or optional visual cues. Each state displays a list of fields from either the layout or the individual card data source, plus a list of Vlocity Actions. You can also associate each state with a flyout, an extended version of a card with supplemental data displayed in a larger area.
 
•	Data sources available for cards & layouts:
a.       Integration Procedure Vlocity recommends using a Vlocity Integration Procedure as a data source for optimal flexibility and easier implementation.
b.       DataRaptor Extract
c.       Apex Class
d.       SOQL & SOSL query (not recommended)
 
•	Omniscript: OmniScript is an omnichannel customer engagement and a business tool built on the Salesforce platform. OmniScript allows you to craft dynamic customer interactions without code and deploy to multiple channels and devices. Administrators can define a script once and then deploy the script within a Salesforce application or on a web page. You can create OmniScripts to guide users through sales and service processes with fast, personalized responses, and seamless integration to enterprise applications and data.
 
•	Omniscript best practices:
a.       Avoid assigning a ContextId within the OmniScript. OmniScript's ContextId is a reserved key that is assigned by the URL.
b.       When processes are repeatable across multiple OmniScripts, create a reusable OmniScript, and add it to the appropriate parent OmniScripts.
c.       Store custom templates in a single location such as a static resource or in Vlocity Templates.
d.       Reduce Conditional Views, Merge Fields, Formulas where possible.
e.       Remove spaces from element names to improve the OmniScript's load time.
f.        Reduce the number of elements in the script. A single OmniScript should not exceed 200 elements.
 
•	Dataraptor Turbo: A DataRaptor Turbo Extract retrieves data from a single Salesforce object type, with support for fields from related objects. You can filter the data and select the fields to return. Unlike a standard DataRaptor Extract, a DataRaptor Turbo Extract doesn't support formulas. There is no Output tab, so you can't use mappings to structure the output. Custom JSON, default values, attributes, and translations aren't supported. A DataRaptor Turbo Extract has two advantages over a standard DataRaptor Extract : Simpler configuration & Better performance at runtime.
 


*/
    }
}