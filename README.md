<div align="center">
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/banner.png" alt="Intro Logo" width="96%"/>
</div>
<br/>
<h3 align="center">Real-Time Dashboard to Track Production Status with focus on Downtime</h3>
<hr>

## Table of contents
* [Introduction](#introduction)
* [Methodology](#methodology)
* [Dashboard Details](#dashboard-details)
* [Conclusion](#conclusion)

## Introduction
One of the strengths of PowerBI lies in its seamless integration with multiple types of data sources, allowing users to build their data architecture on the fly and provide Business Intelligence updates through reporting and dashboarding. 

With the availability of Online Transactional Processing (OLTP) or Online Analytical Processing (OLAP) databases, Power BI's implementation becomes even more flexible. In OLAP databases, users can construct their own Extract, Transform, Load (ETL) pipelines to load data into a base table, which can then be utilized for dashboarding. This approach is commonly employed in batch processing scenarios. On the other hand, for real-time reporting, a stored procedure can be written to prepare the data and directly load it into Power BI. Or, individual tables/data sources like Spreadsheets/Excel can be loaded as is and relations can be designed and processed within the platform. The choice of approach depends on the availability of resources, design requirements, and the goal of achieving a robust Business Intelligence report or dashboard.

In this project, I try to use multiple datasources i.e. Spreadsheet (containing ERP details of production line machine-run) and a table from database (containg machine run details) to load data in PowerBI, integrate these two data sources by defining appropriate relation and generate a Downtime report to help a business understand about its process and make data driven decisions.

## Methodology
The whole design of the data flow was divided in two sections. The first one contained loading and cleaning the ERP data which was in form of a spreadsheet placed at a certain source folder location. The data in this sheet is completely messy and with help of power query, number of steps were wirtten to remove unnecessary fields, clean, filter and perform required transformations before loading it into the DAX. 

The machine data was loaded with help of a stored procedure. Due to unavailability of proper resources and data pipelines, for a immedidate solution, the Stored-Proc was written in such a way that it can load machine data in realtime from another database and update-insert (upsert) in the base table which will then be consumed in PowerBI. Although as data size grews, the loading process can take longer time and necessary filters/indexing strategies can be applied on the database table to optimize the performance. But for this project those steps were not required to be performed. Every calculation related to identifying downtime was written with help fo DAX and DAX measures. Those informations were not readily available and thus assumptions were made to calculate required metrics to closely follow actual scenarios.

In the following section, the PowerBi report details has been provided with pictorial representation.

## Dashboard Details
The following image shows the home page of the PowerBI report. The report includes few production KPIs related to a particular product, the date-range upto what data is available, graphs with focus on downtime such as the individual batches/jobs of run, downtime by operator, % of downtime against total run-time, downtime based on hour of the day/week and also a pivot table to help users cross reference/debug based on transactions made in the ERP system.

<p align="center">
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/report_home.PNG" width="80%"/>
</p>

In order to help any new users, every visual in the dashboard has been provided with details and also a welcome note has been included using the report-tooltip functionality as shown in the below image.

<p align="center">
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/report_welcome_tooltip.PNG" width="40%"/>
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/report_helpicon_tooltips.PNG" width="40%"/>
</p>

Also filters has been provided to dice and slice the data as per user need along with a clear-all button.
<p align="center">
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/report_filterpanes.PNG" width="40%"/>
</p>

Every visual on the report is connected to each other (although there is a possibility to manage visual interactions but was not required) thus users can click on any of the visual to filter as per necessity. This functionality depicted in the following left-image. As it can be seen, an user clicks on an operator 'SM3' in 'Downtime By Operators' visual and all corresponding data is filtered accordingly thus providing the user with every details related to that operator. Or users can also use the filter-pane to filter information as per requirement. This is depicted in the following right-image where all data related to medium sized product has been filtered.

<p align="center">
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/filtered_2.PNG" width="40%"/>
<img src="https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/img/filtered_1.PNG" width="40%"/>
</p>

**Link To Report**: [Downtime_Report.pbix](<https://github.com/skswar/Realtime_Machine_Downtime_Tracking_PowerBI/blob/main/power_bi_report/Downtime_Report.pbix>)

**Note**: Only will be shared upon verified requests.

## Conclusion
PowerBI is a great tool that enables organizations to gain valuable insights based on data gathered through multiple channels/application the orgnaization employs or even through exteral data sources. It serves as a catalyst for data-driven decision-making, leading to improved operational efficiency. In this project I tried to demosntrate the effective steps that can be taken and how data can be harnessed to provide valuable insights into current processes, and thus help in taking informed actions for continuous improvement. 

Not only in production downtime monitoring sector but PowerBI can also be employed to monitor Extract-Transform-Load transaction pipelines in real time, Sales/Financial data monitoring, help with Live Audit processes, tracking Scrubs and many more. The platform's capabilities in versatile applications make it an indispensable tool for organizations seeking to optimize their operations and make data-driven decisions across various domains. If you are interested to build a BI solution for your organization and would like to talk to me, I would love to have a discussion. You can contact me through [Linked-In](http://linkedin.com/in/sayankrswar) or shoot an [email](mailto:sayankrswar@hotmail.com). Thank You for your patience and going through the complete article.

Note: The complete data source could not be shared due to proprietary reasons. The provided data/code has been masked.
