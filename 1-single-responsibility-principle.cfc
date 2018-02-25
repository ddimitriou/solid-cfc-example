// Single Responsibility Principle Violation
component bindingName="Report"
{
    public string function getTitle()
    {
        return 'Report Title';
    }

    public string function getDate()
    {
        return '2016-04-21';
    }

    public struct function getContents()
    {
        return {
            'title' = getTitle(),
            'date' = getDate()
        };
    }

    public string function formatJson()
    {
        return serializeJson(getContents());
    }
}

// Refactored
component bindingName="Report"
{
    public string function getTitle()
    {
        return 'Report Title';
    }

    public string function getDate()
    {
        return '2016-04-21';
    }

    public struct function getContents()
    {
        return {
            'title' = getTitle(),
            'date' = getDate()
        };
    }
}

interface bingingName="ReportFormattable"
{
    public string function format(required Report report);
}

component bingingName="JsonReportFormatter" implements="ReportFormattable" accessors="true"
{
    public string function format(required Report report)
    {
        return serializeJson(report.getContents());
    }
}
